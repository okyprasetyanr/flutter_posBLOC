import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/bottom_page/button_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/bottom_page/dropdown_category_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/bottom_page/form_field_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/dropdown_cabang.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/filters_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/grid_view_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/search_and_cabang.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/kategori_page/bottom_page/button_kategori.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/kategori_page/bottom_page/text_field_and_branch.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/kategori_page/top_page/list_view_kategori.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/widget/common_widget/widget_navigation_gesture.dart';

class UIInventory extends StatefulWidget {
  const UIInventory({super.key});

  @override
  State<UIInventory> createState() => _UIInventoryState();
}

class _UIInventoryState extends State<UIInventory> {
  List<String> filters = [
    "A-Z",
    "Z-A",
    "Terbaru",
    "Terlama",
    "Stock +",
    "Stock -",
  ];
  List<String> statusItem = ["Active", "Deactive"];
  List<String> filterjenis = ["All", "Condiment", "Normal"];
  List<ModelKategori> filterkategori = [
    ModelKategori(nameCategory: "All", idCategory: "0", idBranch: "0"),
  ];

  String? selectedFilterItem;
  String? selectedStatusItem;
  String? selectedFilterJenisItem;
  String? selectedFilterKategoriItem;
  TextEditingController namaItemController = TextEditingController();
  TextEditingController cabangItemController = TextEditingController();
  TextEditingController hargaItemController = TextEditingController();
  TextEditingController kodeBarcodeController = TextEditingController();
  TextEditingController namaKategoriController = TextEditingController();
  final isOpen = ValueNotifier<bool>(false);

  PageController pageControllerTop = PageController();
  PageController pageControllerBottom = PageController();

  StreamSubscription? _inventorySub;

  @override
  void dispose() {
    if (mounted) {
      _inventorySub?.cancel();
      namaItemController.dispose();
      cabangItemController.dispose();
      hargaItemController.dispose();
      kodeBarcodeController.dispose();
      namaKategoriController.dispose();
      pageControllerTop.dispose();
      pageControllerBottom.dispose();
    }
    super.dispose();
  }

  final currentPage = ValueNotifier<bool>(true);

  void _gotoPage(bool page) {
    int goto = page ? 0 : 1;
    currentPage.value = page;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageControllerTop.hasClients && pageControllerBottom.hasClients) {
        pageControllerTop.animateToPage(
          goto,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        pageControllerBottom.animateToPage(
          goto,

          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    selectedFilterItem = filters.first;
    selectedStatusItem = statusItem.first;
    selectedFilterJenisItem = filterjenis.first;
    selectedFilterKategoriItem = filterkategori.first.getidCategory;

    final bloc = context.read<InventoryBloc>();
    bloc.add(
      InvFilterItem(
        filter: selectedFilterItem!,
        status: selectedStatusItem!,
        filterjenis: selectedFilterJenisItem!,
        filterIDKategori: selectedFilterKategoriItem!,
      ),
    );
    bloc.add(
      InvAmbilData(
        idCabang: null,
        filter: selectedFilterItem!,
        status: selectedStatusItem!,
        filterjenis: selectedFilterJenisItem!,
        filterIDKategori: selectedFilterKategoriItem!,
      ),
    );

    await _inventorySub?.cancel();
    _inventorySub = bloc.stream.listen((state) {
      if (state is InventoryLoaded) {
        if (state.dataSelectedItem != null) {
          namaItemController.text = state.dataSelectedItem!.getnameItem;
          kodeBarcodeController.text = state.dataSelectedItem!.getBarcode;
          hargaItemController.text = "${state.dataSelectedItem!.getpriceItem}";

          bloc.add(
            InvCondimentForm(
              condimentForm: state.dataSelectedItem!.getstatusCondiment,
            ),
          );

          bloc.add(
            InvSelectedKategoriItem(
              dataKategoriItem: state.dataKategori.firstWhere(
                (element) =>
                    element.getidCategory ==
                    state.dataSelectedItem!.getidCategoryiItem,
              ),
            ),
          );
        }
      }
    });
  }

  Future<void> _onRefresh() async {
    final bloc = context.read<InventoryBloc>();
    bloc.add(InvResetItemForm());
    bloc.add(InvResetKategoriForm());
    _resetItemForm();
    namaKategoriController.clear();

    await context.read<DataUserRepositoryCache>().initData();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    context.select<InventoryBloc, List<ModelKategori>>((value) {
      final dataKategori = value.state is InventoryLoaded
          ? (value.state as InventoryLoaded).dataKategori
          : null;
      return filterkategori = [
        filterkategori.first,
        if (dataKategori != null) ...dataKategori,
      ];
    });
    return LayoutTopBottom(
      refreshIndicator: _onRefresh,
      layoutTop: topLayout(),
      layoutBottom: bottomLayout(),
      widgetNavigation: navigationGesture(),
    );
  }

  Widget topLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                isOpen.value = !isOpen.value;
              },
              label: Text("Menu", style: lv05TextStyleWhite),
              icon: Icon(Icons.menu_rounded, color: Colors.white, size: 20),
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                minimumSize: const WidgetStatePropertyAll(Size(0, 0)),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                backgroundColor: WidgetStatePropertyAll(AppColor.primary),
              ),
            ),

            GestureDetector(
              onTap: () {
                _gotoPage(!currentPage.value);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 150,
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                height: 40,
                child: ValueListenableBuilder(
                  valueListenable: currentPage,
                  builder: (context, value, child) {
                    return Stack(
                      children: [
                        AnimatedPositioned(
                          curve: Curves.easeInOut,
                          left: value ? -200 : 40,
                          top: 4,
                          duration: const Duration(milliseconds: 500),
                          child: rowContentAnim(
                            const Icon(Icons.swap_horiz_rounded, size: 25),
                            Text("Kategori", style: titleTextStyle),
                          ),
                        ),
                        AnimatedPositioned(
                          curve: Curves.easeInOut,
                          left: value ? 35 : 300,
                          top: 4,
                          duration: const Duration(milliseconds: 500),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: rowContentAnim(
                              const Icon(Icons.swap_horiz_rounded, size: 25),
                              Text("Inventori", style: titleTextStyle),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: PageView(
            controller: pageControllerTop,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIInventorySearchAndCabang(
                    selectedFilterItem: selectedFilterItem,
                    selectedStatusItem: selectedStatusItem,
                    selectedFilterJenisItem: selectedFilterJenisItem,
                    selectedFilterKategoriItem: selectedFilterKategoriItem,
                  ),

                  const SizedBox(height: 10),

                  UIFiltersItem(
                    filters: filters,
                    statusItem: statusItem,
                    filterjenis: filterjenis,
                    filterkategori: filterkategori,
                    selectedFilterItem: selectedFilterItem,
                    selectedStatusItem: selectedStatusItem,
                    selectedFilterJenisItem: selectedFilterJenisItem,
                    selectedFilterKategoriItem: selectedFilterKategoriItem,
                    onFilterChangedCallBack:
                        ({
                          required String filter,
                          required String status,
                          required String filterjenis,
                          required String filterIDKategori,
                        }) {
                          selectedFilterItem = filter;
                          selectedStatusItem = status;
                          selectedFilterJenisItem = filterjenis;
                          selectedFilterKategoriItem = filterIDKategori;

                          context.read<InventoryBloc>().add(
                            InvFilterItem(
                              filter: filter,
                              status: status,
                              filterjenis: filterjenis,
                              filterIDKategori: filterIDKategori,
                            ),
                          );
                        },
                  ),

                  const SizedBox(height: 10),

                  Expanded(child: UIInventoryGridViewItem()),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: 150,
                    child: UIInventoryDropdownCabang(
                      selectedFilterItem: selectedFilterItem!,
                      selectedStatusItem: selectedStatusItem!,
                      selectedFilterJenisItem: selectedFilterJenisItem!,
                      selectedFilterKategoriItem: selectedFilterKategoriItem!,
                    ),
                  ),
                  Expanded(child: ListViewKategori()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomLayout() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: GestureDetector(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 250,
              height: 35,
              child: ValueListenableBuilder(
                valueListenable: currentPage,
                builder: (context, value, child) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        right: value ? -250 : 0,
                        top: 4,
                        duration: const Duration(milliseconds: 500),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _resetKategoriForm();
                          },
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                            ),
                            minimumSize: const WidgetStatePropertyAll(
                              Size(0, 30),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                          ),
                          icon: const Icon(Icons.restart_alt_rounded, size: 20),
                          label: Text("Detail Kategori", style: titleTextStyle),
                        ),
                      ),
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        right: value ? 0 : -200,
                        top: 0,
                        duration: const Duration(milliseconds: 500),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context.read<InventoryBloc>().add(
                              InvResetItemForm(),
                            );
                            _resetItemForm();
                          },
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                            ),
                            minimumSize: const WidgetStatePropertyAll(
                              Size(0, 30),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                          ),
                          icon: const Icon(Icons.restart_alt_rounded, size: 20),
                          label: Text("Detail Item", style: titleTextStyle),
                        ),
                      ),
                      AnimatedPositioned(
                        top: 0,
                        curve: Curves.easeInOut,
                        left: value ? 0 : 450,
                        duration: const Duration(milliseconds: 500),
                        child: SizedBox(
                          width: 250,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Jenis Item",
                                      style: lv1TextStyle,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  style: lv05TextStyle,
                                  initialValue: filterjenis.first,
                                  items: filterjenis
                                      .map(
                                        (map) => DropdownMenuItem(
                                          value: map,
                                          child: Text(
                                            map,
                                            style: lv05TextStyle,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    selectedFilterJenisItem = value;
                                    context.read<InventoryBloc>().add(
                                      InvFilterItem(
                                        filter: selectedFilterItem!,
                                        status: selectedStatusItem!,
                                        filterjenis: selectedFilterJenisItem!,
                                        filterIDKategori:
                                            selectedFilterKategoriItem!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageControllerBottom,
            reverse: true,
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      children: [
                        UIInventoryFormFieldItem(
                          namaItemController: namaItemController,
                          kodeBarcodeController: kodeBarcodeController,
                          hargaItemController: hargaItemController,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child: DropdownKategoriItem()),
                            const SizedBox(width: 10),
                            Expanded(
                              child: customTextField(
                                "Cabang",
                                TextEditingController(
                                  text: context.select<InventoryBloc, String>(
                                    (value) => value.state is InventoryLoaded
                                        ? (value.state as InventoryLoaded)
                                                  .daerahCabang ??
                                              ""
                                        : "",
                                  ),
                                ),
                                false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: UIInventoryButtonItem(
                      namaItemController: namaItemController,
                      hargaItemController: hargaItemController,
                      kodeBarcodeController: kodeBarcodeController,
                      resetItemForm: () {
                        _resetItemForm();
                      },
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  UICategoryTextFieldAndBranch(
                    namaKategoriController: namaKategoriController,
                    resetKategoriForm: _resetKategoriForm,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: UIKategoriButtonKategori(
                      namaKategoriController: namaKategoriController,
                      resetKategoriForm: () => _resetKategoriForm(),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        "PANDUAN:\nUntuk hapus Kategori, silahkan klik dan tahan Kategori yang diinginkan",
                        style: lv05TextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget navigationGesture() {
    final contentNavGesture = [
      {
        "id": "inventory",
        "toContext": "/inventory",
        "text_menu": "Inventori",
        "onTap": () {},
      },
    ];

    return NavigationGesture(
      currentPage: "inventory",
      attContent: contentNavGesture,
      isOpen: isOpen,
      close: () {
        isOpen.value = false;
      },
    );
  }

  Widget rowContentAnim(Icon iconContent, Text textCOntent) {
    return Row(children: [iconContent, textCOntent]);
  }

  void _resetItemForm() {
    final bloc = context.read<InventoryBloc>();
    bloc.add(InvResetItemForm());
    namaItemController.clear();
    hargaItemController.clear();
    kodeBarcodeController.clear();
  }

  void _resetKategoriForm() {
    context.read<InventoryBloc>().add(InvResetKategoriForm());
    namaKategoriController.clear();
  }
}
