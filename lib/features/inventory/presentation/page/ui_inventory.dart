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
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/dropdown_branch.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/filters_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/grid_view_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/search_and_cabang.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/category_page/bottom_page/button_category.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/category_page/bottom_page/text_field_and_branch.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/category_page/top_page/list_view_category.dart';
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
  List<String> filterTypeItem = ["All", "Condiment", "Normal"];
  List<ModelCategory> filterCategory = [
    ModelCategory(nameCategory: "All", idCategory: "0", idBranch: "0"),
  ];
  final selectedIdCategoryItem = ValueNotifier<String?>(null);
  String? selectedFilterItem;
  String? selectedStatusItem;
  String? selectedFilterJenisItem;
  String? selectedFilterCategoryItem;

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameItemController = TextEditingController();
  TextEditingController branchItemController = TextEditingController();
  TextEditingController priceItemController = TextEditingController();
  TextEditingController codeBarcodeController = TextEditingController();
  TextEditingController nameCategoryController = TextEditingController();
  final isOpen = ValueNotifier<bool>(false);
  final currentPage = ValueNotifier<bool>(true);

  PageController pageControllerTop = PageController();
  PageController pageControllerBottom = PageController();

  @override
  void dispose() {
    if (mounted) {
      isOpen.dispose();
      currentPage.dispose();
      nameItemController.dispose();
      branchItemController.dispose();
      priceItemController.dispose();
      codeBarcodeController.dispose();
      nameCategoryController.dispose();
      pageControllerTop.dispose();
      pageControllerBottom.dispose();
    }
    super.dispose();
  }

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
    selectedFilterJenisItem = filterTypeItem.first;
    selectedFilterCategoryItem = filterCategory.first.getidCategory;

    final bloc = context.read<InventoryBloc>();
    bloc.add(
      InvFilterItem(
        filter: selectedFilterItem!,
        status: selectedStatusItem!,
        filterjenis: selectedFilterJenisItem!,
        filterIDCategory: selectedFilterCategoryItem!,
      ),
    );
    bloc.add(
      InvGetData(
        idBranch: null,
        filter: selectedFilterItem!,
        status: selectedStatusItem!,
        filterjenis: selectedFilterJenisItem!,
        filterIDCategory: selectedFilterCategoryItem!,
      ),
    );
  }

  Future<void> _onRefresh() async {
    final bloc = context.read<InventoryBloc>();
    bloc.add(InvResetItemForm());
    bloc.add(InvResetCategoryForm());
    _resetItemForm();
    nameCategoryController.clear();

    await context.read<DataUserRepositoryCache>().initItem();
    await context.read<DataUserRepositoryCache>().initCategory();

    _initData();
    print("UI Inventory: initData");
  }

  @override
  Widget build(BuildContext context) {
    context.select<InventoryBloc, List<ModelCategory>>((value) {
      final dataCategory = value.state is InventoryLoaded
          ? (value.state as InventoryLoaded).dataCategory
          : null;
      return filterCategory = [
        filterCategory.first,
        if (dataCategory != null) ...dataCategory,
      ];
    });
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pop(context);
          context.read<InventoryBloc>().add(InvResetCategoryForm());
          context.read<InventoryBloc>().add(InvResetItemForm());
        }
      },
      child: LayoutTopBottom(
        refreshIndicator: _onRefresh,
        layoutTop: topLayout(),
        layoutBottom: bottomLayout(),
        widgetNavigation: navigationGesture(),
      ),
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
                  UIInventorySearchAndBranch(
                    selectedFilterItem: selectedFilterItem,
                    selectedStatusItem: selectedStatusItem,
                    selectedFilterJenisItem: selectedFilterJenisItem,
                    selectedFilterCategoryItem: selectedFilterCategoryItem,
                  ),

                  const SizedBox(height: 10),

                  UIFiltersItem(
                    filters: filters,
                    statusItem: statusItem,
                    filterjenis: filterTypeItem,
                    filterCategory: filterCategory,
                    selectedFilterItem: selectedFilterItem,
                    selectedStatusItem: selectedStatusItem,
                    selectedFilterJenisItem: selectedFilterJenisItem,
                    selectedFilterCategoryItem: selectedFilterCategoryItem,
                    onFilterChangedCallBack:
                        ({
                          required String filter,
                          required String status,
                          required String filterjenis,
                          required String filterIDCategory,
                        }) {
                          selectedFilterItem = filter;
                          selectedStatusItem = status;
                          selectedFilterJenisItem = filterjenis;
                          selectedFilterCategoryItem = filterIDCategory;

                          context.read<InventoryBloc>().add(
                            InvFilterItem(
                              filter: filter,
                              status: status,
                              filterjenis: filterjenis,
                              filterIDCategory: filterIDCategory,
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
                    child: UIInventoryDropdownBranch(
                      selectedFilterItem: selectedFilterItem!,
                      selectedStatusItem: selectedStatusItem!,
                      selectedFilterJenisItem: selectedFilterJenisItem!,
                      selectedFilterCategoryItem: selectedFilterCategoryItem!,
                    ),
                  ),
                  Expanded(child: ListViewCategory()),
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
                            _resetCategoryForm();
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
                                  initialValue: filterTypeItem.first,
                                  items: filterTypeItem
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
                                        filterIDCategory:
                                            selectedFilterCategoryItem!,
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
                          formKey: _formKey,
                          nameItemController: nameItemController,
                          codeBarcodeController: codeBarcodeController,
                          priceItemController: priceItemController,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownCategoryItem(
                                idCategory: selectedIdCategoryItem,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: customTextField(
                                "Cabang",
                                TextEditingController(
                                  text: context.select<InventoryBloc, String>(
                                    (value) => value.state is InventoryLoaded
                                        ? (value.state as InventoryLoaded)
                                                  .areaBranch ??
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
                      formKey: _formKey,
                      nameItemController: nameItemController,
                      priceItemController: priceItemController,
                      codeBarcodeController: codeBarcodeController,
                      selectedIdCategoryItem: selectedIdCategoryItem,
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
                    nameCategoryController: nameCategoryController,
                    resetCategoryForm: _resetCategoryForm,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: UICategoryButtonCategory(
                      nameCategoryController: nameCategoryController,
                      resetCategoryForm: () => _resetCategoryForm(),
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
                        "PANDUAN:\nUntuk hapus Kategori, silahkan geser kiri Kategori yang diinginkan.",
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
      {
        "id": "batch",
        "toContext": "/batch",
        "text_menu": "Batch",
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
    _formKey.currentState!.reset();
    final bloc = context.read<InventoryBloc>();
    bloc.add(InvResetItemForm());
    nameItemController.clear();
    priceItemController.clear();
    codeBarcodeController.clear();
  }

  void _resetCategoryForm() {
    context.read<InventoryBloc>().add(InvResetCategoryForm());
    nameCategoryController.clear();
  }
}
