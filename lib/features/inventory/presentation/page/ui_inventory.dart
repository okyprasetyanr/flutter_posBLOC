import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/bottom_page/condiment_switch.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/bottom_page/dropdown_kategori_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/filters_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/grid_view_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/kategori_page/top_page/list_view_kategori.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/widget_navigation_gesture.dart';
import 'package:flutter_pos/widget/widget_snack_bar.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    ModelKategori(namaKategori: "All", idkategori: "0", idCabang: "0"),
  ];

  String? selectedFilterItem;
  String? selectedStatusItem;
  String? selectedIdKategori;
  String? selectedFilterJenisItem;
  String? selectedFilterKategoriItem;
  double ratioGridView = 0;
  TextEditingController namaItemController = TextEditingController();
  TextEditingController cabangItemController = TextEditingController();
  TextEditingController hargaItemController = TextEditingController();
  TextEditingController kodeBarcodeController = TextEditingController();
  TextEditingController namaKategoriController = TextEditingController();
  bool isOpen = false;

  PageController pageControllerTop = PageController();
  PageController pageControllerBottom = PageController();

  // @override
  // void dispose() {
  //   namaItemController.dispose();
  //   cabangItemController.dispose();
  //   hargaItemController.dispose();
  //   kodeBarcodeController.dispose();
  //   namaKategoriController.dispose();
  //   pageControllerTop.dispose();
  //   pageControllerBottom.dispose();
  //   super.dispose();
  // }

  bool currentPage = true;

  void _gotoPage(bool page) {
    int goto = page ? 0 : 1;
    setState(() {
      currentPage = page;
    });
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

  void _initData() {
    selectedFilterItem = filters.first;
    selectedStatusItem = statusItem.first;
    selectedFilterJenisItem = filterjenis.first;
    selectedFilterKategoriItem = filterkategori.first.getidKategori;

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
    bloc.stream.listen((state) {
      if (state is InventoryLoaded) {
        if (state.dataSelectedItem != null) {
          namaItemController.text = state.dataSelectedItem!.getnamaItem;
          kodeBarcodeController.text = state.dataSelectedItem!.getBarcode;
          hargaItemController.text = state.dataSelectedItem!.gethargaItem;

          bloc.add(
            InvCondimentForm(
              condimentForm: state.dataSelectedItem!.getstatusCondiment,
            ),
          );

          bloc.add(
            InvSelectedKategoriItem(
              dataKategoriItem: state.dataKategori.firstWhere(
                (element) =>
                    element.getidKategori ==
                    state.dataSelectedItem!.getidKategoriItem,
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

    selectedIdKategori = context.select<InventoryBloc, String?>(
      (bloc) => bloc.state is InventoryLoaded
          ? (bloc.state as InventoryLoaded)
                .dataSelectedKategoriItem
                ?.getidKategori
          : null,
    );

    final orientasi = MediaQuery.of(context).orientation;
    ratioGridView = orientasi == Orientation.portrait ? 8 / 12 : 6 / 10;
    return LayoutTopBottom(
      refreshIndicator: _onRefresh,
      widgetTop: topLayout(),
      widgetBottom: bottomLayout(),
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
                setState(() {
                  isOpen = !isOpen;
                });
              },
              label: Text("Menu", style: lv1TextStyle),
              icon: Icon(Icons.menu_rounded),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  _gotoPage(!currentPage);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 150,
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  height: 55,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        left: currentPage ? -200 : 18,
                        top: 4,
                        duration: const Duration(milliseconds: 500),
                        child: rowContentAnim(
                          const Icon(Icons.swap_horiz_rounded, size: 35),
                          Text("Kategori", style: titleTextStyle),
                        ),
                      ),
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        left: currentPage ? 0 : 300,
                        top: 4,
                        duration: const Duration(milliseconds: 500),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: rowContentAnim(
                            const Icon(Icons.swap_horiz_rounded, size: 35),
                            Text("Inventori", style: titleTextStyle),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            style: lv1TextStyle,
                            decoration: InputDecoration(
                              labelText: "Search...",
                              hintText: "...",
                              labelStyle: lv1TextStyle,
                              hintStyle: lv1TextStyle,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onChanged: (value) {
                              context.read<InventoryBloc>().add(
                                InvSearchitem(text: value),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child:
                              BlocSelector<
                                InventoryBloc,
                                InventoryState,
                                (
                                  List<ModelCabang> data,
                                  String? selectedIDCabang,
                                )
                              >(
                                selector: (state) {
                                  if (state is InventoryLoaded) {
                                    return (state.datacabang, state.idCabang);
                                  }
                                  return ([], "");
                                },
                                builder: (context, state) {
                                  if (state.$1.isEmpty) {
                                    return const SpinKitThreeBounce(
                                      color: Colors.blue,
                                      size: 30.0,
                                    );
                                  }
                                  return DropdownButtonFormField<ModelCabang>(
                                    decoration: InputDecoration(
                                      label: Text(
                                        "Pilih Cabang",
                                        style: lv1TextStyle,
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                                    initialValue: state.$1.firstWhere(
                                      (data) => data.getidCabang == state.$2,
                                    ),
                                    items: state.$1
                                        .map(
                                          (map) => DropdownMenuItem(
                                            value: map,
                                            child: Text(
                                              map.getdaerahCabang,
                                              style: lv05TextStyle,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      String idCabang = value!.getidCabang;
                                      context.read<InventoryBloc>().add(
                                        InvAmbilData(
                                          idCabang: idCabang,
                                          filter: selectedFilterItem!,
                                          status: selectedStatusItem!,
                                          filterjenis: selectedFilterJenisItem!,
                                          filterIDKategori:
                                              selectedFilterKategoriItem!,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                        ),
                      ],
                    ),
                  ),

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
                  Expanded(child: GridViewItem(ratioGridView: ratioGridView)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 150,
                    child:
                        BlocSelector<
                          InventoryBloc,
                          InventoryState,
                          (List<ModelCabang> data, String? selectedIDCabang)
                        >(
                          selector: (state) {
                            if (state is InventoryLoaded) {
                              return (state.datacabang, state.idCabang);
                            }
                            return ([], "");
                          },
                          builder: (context, state) {
                            if (state.$1.isEmpty) {
                              return const SpinKitThreeBounce(
                                color: Colors.blue,
                                size: 30.0,
                              );
                            }
                            return DropdownButtonFormField<ModelCabang>(
                              style: lv1TextStyle,
                              initialValue: state.$1.firstWhere(
                                (data) => data.getidCabang == state.$2,
                              ),
                              items: state.$1
                                  .map(
                                    (map) => DropdownMenuItem(
                                      value: map,
                                      child: Text(map.getdaerahCabang),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                context.read<InventoryBloc>().add(
                                  InvAmbilData(
                                    filter: selectedFilterItem!,
                                    status: selectedStatusItem!,
                                    idCabang: value!.getidCabang,
                                    filterjenis: selectedFilterJenisItem!,
                                    filterIDKategori:
                                        selectedFilterKategoriItem!,
                                  ),
                                );
                              },
                            );
                          },
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
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              height: 60,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    curve: Curves.easeInOut,
                    right: currentPage ? -250 : 0,
                    top: 4,
                    duration: const Duration(milliseconds: 500),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _resetKategoriForm();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      icon: const Icon(Icons.restart_alt_rounded, size: 25),
                      label: Text("Detail Kategori", style: titleTextStyle),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.easeInOut,
                    right: currentPage ? 0 : 500,
                    top: 4,
                    duration: const Duration(milliseconds: 500),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<InventoryBloc>().add(InvResetItemForm());
                        _resetItemForm();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      icon: const Icon(Icons.restart_alt_rounded, size: 25),
                      label: Text("Detail Item", style: titleTextStyle),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.easeInOut,
                    left: currentPage ? 10 : -250,
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      width: 250,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: DropdownButtonFormField<String>(
                              initialValue: filterjenis.first,
                              items: filterjenis
                                  .map(
                                    (map) => DropdownMenuItem(
                                      value: map,
                                      child: Text(map, style: lv05TextStyle),
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
              ),
            ),
          ),
        ),
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
                      padding: EdgeInsets.all(10),
                      children: [
                        Column(
                          children: [
                            customTextField("Nama Item", namaItemController),
                            const SizedBox(height: 10),
                            customTextField(
                              "Kode/Barcode",
                              kodeBarcodeController,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: customTextField(
                                    "Harga",
                                    hargaItemController,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.loose,
                                  child: CondimentSwitch(),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Padding(
                          padding: EdgeInsetsGeometry.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(child: DropdownKategoriItem()),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  style: lv1TextStyleDisable,
                                  enabled: false,
                                  controller: TextEditingController(
                                    text: context.select<InventoryBloc, String>(
                                      (value) => value.state is InventoryLoaded
                                          ? (value.state as InventoryLoaded)
                                                    .daerahCabang ??
                                                ""
                                          : "",
                                    ),
                                  ),
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Cabang",
                                      style: lv05TextStyle,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            label: Text("Hapus", style: lv0TextStyleRED),
                            icon: Icon(Icons.delete, color: Colors.white),
                            style: ElevatedButton.styleFrom(elevation: 4),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (namaItemController.text.isEmpty ||
                                  hargaItemController.text.isEmpty ||
                                  kodeBarcodeController.text.isEmpty ||
                                  selectedIdKategori == null) {
                                customSnackBar(context, "Data belum lengkap!");
                              } else {
                                print("datanya kategori: $selectedIdKategori");
                                final bloc = context
                                    .read<InventoryBloc>()
                                    .state;
                                if (bloc is InventoryLoaded) {
                                  String idUser = bloc.dataSelectedItem == null
                                      ? Uuid().v4()
                                      : bloc.dataSelectedItem!.getidItem;
                                  final data = ModelItem(
                                    qtyItem: 0,
                                    uidUser: UserSession.uidUser!,
                                    namaItem: namaItemController.text,
                                    idItem: idUser,
                                    hargaItem: hargaItemController.text,
                                    idKategoriItem: selectedIdKategori!,
                                    statusCondiment: bloc.condimentForm!,
                                    urlGambar: "",
                                    idCabang: bloc.idCabang!,
                                    barcode: kodeBarcodeController.text,
                                    statusItem: true,
                                    tanggalItem: DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(DateTime.now()),
                                  );
                                  context.read<InventoryBloc>().add(
                                    InvUploadItem(data: data),
                                  );

                                  _resetItemForm();
                                }
                              }
                            },
                            label:
                                BlocSelector<
                                  InventoryBloc,
                                  InventoryState,
                                  String?
                                >(
                                  selector: (state) {
                                    if (state is InventoryLoaded) {
                                      return state.dataSelectedItem != null
                                          ? "Edit"
                                          : "Simpan";
                                    }
                                    return "Simpan";
                                  },
                                  builder: (context, state) {
                                    return Text(
                                      state!,
                                      style: lv1TextStyleWhite,
                                    );
                                  },
                                ),

                            icon: Icon(Icons.save, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              elevation: 4,
                              backgroundColor: AppColor.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: BlocListener<InventoryBloc, InventoryState>(
                          listenWhen: (previous, current) =>
                              previous is InventoryLoaded &&
                              current is InventoryLoaded &&
                              previous.dataSelectedKategori !=
                                  current.dataSelectedKategori,
                          listener: (context, state) {
                            if (state is InventoryLoaded &&
                                state.dataSelectedKategori != null) {
                              namaKategoriController.text =
                                  state.dataSelectedKategori!.getnamaKategori;
                            }
                          },
                          child: customTextField(
                            "Nama Kategori",
                            namaKategoriController,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          style: lv1TextStyleDisable,
                          enabled: false,
                          controller: TextEditingController(
                            text: context.select<InventoryBloc, String?>(
                              (data) => data.state is InventoryLoaded
                                  ? (data.state as InventoryLoaded).daerahCabang
                                  : "",
                            ),
                          ),
                          decoration: const InputDecoration(
                            labelText: "Cabang",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                        BlocSelector<
                          InventoryBloc,
                          InventoryState,
                          ModelKategori?
                        >(
                          selector: (state) {
                            if (state is InventoryLoaded) {
                              return state.dataSelectedKategori;
                            }
                            return null;
                          },
                          builder: (context, state) {
                            return ElevatedButton.icon(
                              onPressed: () async {
                                if (namaKategoriController.text
                                    .trim()
                                    .isEmpty) {
                                  customSnackBar(
                                    context,
                                    "Nama kategori Kosong!",
                                  );
                                  return;
                                }
                                String idkategori =
                                    state?.getidKategori ?? const Uuid().v4();
                                Map<String, dynamic> pushKategori = {
                                  "nama_kategori": namaKategoriController.text,
                                  "id_kategori": idkategori,
                                  "uid_user": UserSession.ambilUidUser(),
                                  "id_cabang":
                                      (context.read<InventoryBloc>().state
                                              as InventoryLoaded)
                                          .idCabang,
                                };
                                context.read<InventoryBloc>().add(
                                  InvUploadKategori(data: pushKategori),
                                );

                                _resetKategoriForm();
                              },
                              style: ElevatedButton.styleFrom(
                                iconColor: Colors.white,
                                backgroundColor: AppColor.primary,
                              ),
                              icon: const Icon(Icons.check),
                              label: Text(
                                state == null ? "Simpan" : "Edit",
                                style: lv1TextStyleWhite,
                              ),
                            );
                          },
                        ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
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
        "toContext": const UIInventory(),
        "text_menu": "Inventori",
        "onTap": () {},
      },
    ];

    return NavigationGesture(
      currentPage: "inventory",
      attContent: contentNavGesture,
      isOpen: isOpen,
      close: () {
        setState(() {
          isOpen = false;
        });
      },
    );
  }

  Widget rowContentAnim(Icon iconContent, Text textCOntent) {
    return Row(children: [iconContent, textCOntent]);
  }

  Widget customTextField(String text, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: lv05TextStyle,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(text, style: lv1TextStyle),
        hint: Text("$text...", style: lv05TextStyle),
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _resetItemForm() {
    final bloc = context.read<InventoryBloc>();
    bloc.add(InvResetItemForm());
    namaItemController.clear();
    hargaItemController.clear();
    kodeBarcodeController.clear();
    selectedIdKategori = null;
  }

  void _resetKategoriForm() {
    context.read<InventoryBloc>().add(InvResetKategoriForm());
    namaKategoriController.clear();
  }
}
