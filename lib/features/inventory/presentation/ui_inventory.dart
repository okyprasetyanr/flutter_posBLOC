import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
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

class UiInventory extends StatefulWidget {
  const UiInventory({super.key});

  @override
  State<UiInventory> createState() => _UiInventoryState();
}

class _UiInventoryState extends State<UiInventory> {
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
  StreamSubscription? _inventorySub;
  TextEditingController namaItemController = TextEditingController();
  TextEditingController cabangItemController = TextEditingController();
  TextEditingController hargaItemController = TextEditingController();
  TextEditingController kodeBarcodeController = TextEditingController();
  TextEditingController namaKategoriController = TextEditingController();
  bool isOpen = false;

  PageController pageControllerTop = PageController();
  PageController pageControllerBottom = PageController();

  @override
  void dispose() {
    _inventorySub?.cancel();
    namaItemController.dispose();
    cabangItemController.dispose();
    hargaItemController.dispose();
    kodeBarcodeController.dispose();
    namaKategoriController.dispose();
    pageControllerTop.dispose();
    pageControllerBottom.dispose();
    super.dispose();
  }

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
      AmbilDataInventoryBloc(
        idCabang: null,
        filter: selectedFilterItem!,
        status: selectedStatusItem!,
        filterjenis: selectedFilterJenisItem!,
        filterIDKategori: selectedFilterKategoriItem!,
      ),
    );

    _inventorySub = context.read<InventoryBloc>().stream.listen((stateBloc) {
      if (stateBloc is InventoryLoaded && stateBloc.dataSelectedItem != null) {
        namaItemController.text = stateBloc.dataSelectedItem!.getnamaItem;
        kodeBarcodeController.text = stateBloc.dataSelectedItem!.getBarcode;
        hargaItemController.text = stateBloc.dataSelectedItem!.gethargaItem;

        print("datanya: ${stateBloc.dataSelectedItem!.getidKategoriItem}");

        _setupControllerForm(
          namaItemController,
          (value) => context.read<InventoryBloc>().add(
            UpdateSelectedItem(namaItem: value),
          ),
        );
        _setupControllerForm(
          hargaItemController,
          (value) => context.read<InventoryBloc>().add(
            UpdateSelectedItem(namaItem: value),
          ),
        );
        _setupControllerForm(
          kodeBarcodeController,
          (value) => context.read<InventoryBloc>().add(
            UpdateSelectedItem(namaItem: value),
          ),
        );

        bloc.add(
          CondimentForm(
            condimentForm: stateBloc.dataSelectedItem!.getstatusCondiment,
          ),
        );

        bloc.add(
          InvSelectedKategoriItem(
            dataKategoriItem: stateBloc.dataKategori.firstWhere(
              (element) =>
                  element.getidKategori ==
                  stateBloc.dataSelectedItem!.getidKategoriItem,
            ),
          ),
        );
      }
    });
  }

  void _setupControllerForm(
    TextEditingController controller,
    void Function(String) onChanged,
  ) {
    return controller.addListener(() {
      onChanged(controller.text);
    });
  }

  Future<void> _onRefresh() async {
    final bloc = context.read<InventoryBloc>();
    bloc.add(ResetItemForm());
    bloc.add(ResetKategoriForm());
    _resetItemForm();
    namaKategoriController.clear();
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
                                        AmbilDataInventoryBloc(
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

                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            //FilterItem
                            flex: 1,
                            fit: FlexFit.loose,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  "Pilih FIlter",
                                  style: lv1TextStyle,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              initialValue: selectedFilterItem,
                              items: filters
                                  .map(
                                    (map) => DropdownMenuItem(
                                      value: map,
                                      child: Text(
                                        map,
                                        style: lv05TextStyle,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                selectedFilterItem = value;
                                final bloc = context.read<InventoryBloc>();
                                bloc.add(
                                  InvFilterItem(
                                    idCabang:
                                        (context.read<InventoryBloc>().state
                                                as InventoryLoaded)
                                            .idCabang!,
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
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 140,
                            child: DropdownButtonFormField<ModelKategori>(
                              style: lv05TextStyle,
                              decoration: InputDecoration(
                                label: Text(
                                  "Pilih Kategori",
                                  style: lv1TextStyle,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              hint: Text(
                                filterkategori.first.getnamaKategori,
                                style: lv05TextStyle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              items: filterkategori
                                  .where(
                                    (data) =>
                                        data.getidCabang == "0" ||
                                        data.getidCabang ==
                                            (context.read<InventoryBloc>().state
                                                    as InventoryLoaded)
                                                .idCabang,
                                  )
                                  .map(
                                    (map) => DropdownMenuItem<ModelKategori>(
                                      value: map,
                                      child: Text(
                                        map.getnamaKategori,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onTap: () {
                                if (filterkategori.isEmpty) {
                                  customSnackBar(
                                    context,
                                    "Cabang tidak memiliki Kategori",
                                  );
                                }
                              },
                              onChanged: (value) {
                                context.read<InventoryBloc>().add(
                                  InvFilterItem(
                                    filter: selectedFilterItem!,
                                    status: selectedStatusItem!,
                                    idCabang:
                                        (context.read<InventoryBloc>().state
                                                as InventoryLoaded)
                                            .idCabang!,
                                    filterjenis: selectedFilterJenisItem!,
                                    filterIDKategori: value!.getidKategori,
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(width: 10),
                          Flexible(
                            //StatusItem
                            flex: 1,
                            fit: FlexFit.loose,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  "Pilih Status",
                                  style: lv1TextStyle,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              initialValue: selectedStatusItem,
                              items: statusItem
                                  .map(
                                    (map) => DropdownMenuItem(
                                      value: map,
                                      child: Text(map, style: lv05TextStyle),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                selectedStatusItem = value;
                                final bloc = context.read<InventoryBloc>();
                                bloc.add(
                                  InvFilterItem(
                                    idCabang:
                                        (context.read<InventoryBloc>().state
                                                as InventoryLoaded)
                                            .idCabang!,
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
                  const SizedBox(height: 10),
                  Expanded(
                    child:
                        BlocSelector<
                          InventoryBloc,
                          InventoryState,
                          (List<ModelItem>, String? idCabang)
                        >(
                          selector: (state) {
                            if (state is InventoryLoaded) {
                              return (state.filteredDataItem, state.idCabang);
                            }
                            return ([], null);
                          },
                          builder: (contextBloc, state) {
                            final items = state.$1
                                .where((data) => data.getidCabang == state.$2)
                                .toList();
                            return GridView.builder(
                              padding: EdgeInsets.all(10),
                              itemCount: items.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: ratioGridView,
                                  ),
                              itemBuilder: (context, index) {
                                return Material(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  elevation: 4,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15),
                                    onTap: () {
                                      context.read<InventoryBloc>().add(
                                        InvSelectedItem(
                                          selectedItem: ModelItem(
                                            qtyItem: items[index].getqtyitem,
                                            uidUser: items[index].getuidUser!,
                                            namaItem: items[index].getnamaItem,
                                            idItem: items[index].getidItem,
                                            hargaItem:
                                                items[index].gethargaItem,
                                            idKategoriItem:
                                                items[index].getidKategoriItem,
                                            statusCondiment:
                                                items[index].getstatusCondiment,
                                            urlGambar: "",
                                            idCabang: items[index].getidCabang,
                                            barcode: items[index].getBarcode,
                                            statusItem: true,
                                            tanggalItem:
                                                items[index].getTanggalItem,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsetsGeometry.all(3),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/logo.png",
                                            height: 50,
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            items[index].getnamaItem,
                                            style: lv05TextStyle,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              formatUang(
                                                items[index].gethargaItem,
                                              ),
                                              style: textStyleHarga,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),

                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 5,
                                              ),
                                              child: Text(
                                                formatQty(
                                                  items[index].getqtyitem,
                                                ),
                                                style: lv0TextStyleRED,
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color:
                                                    items[index]
                                                        .getstatusCondiment
                                                    ? AppColor.primary
                                                    : Colors.grey.shade600,
                                              ),
                                              child: Text(
                                                items[index].getstatusCondiment
                                                    ? "Condiment"
                                                    : "Normal",
                                                style: lv05TextStyleWhite,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                  ),
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
                                  AmbilDataInventoryBloc(
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
                  Expanded(
                    child:
                        BlocSelector<
                          InventoryBloc,
                          InventoryState,
                          (List<ModelKategori>? data, String? selectedIDCabang)
                        >(
                          selector: (state) => state is InventoryLoaded
                              ? (state.dataKategori, state.idCabang)
                              : (null, null),
                          builder: (context, state) {
                            if (state.$1 == null) {
                              return Padding(
                                padding: EdgeInsets.all(10),
                                child: const SpinKitThreeBounce(
                                  color: Colors.blue,
                                  size: 30.0,
                                ),
                              );
                            }
                            final dataKategori = state.$1!
                                .where((data) => data.getidCabang == state.$2)
                                .toList();
                            return Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: ListView.builder(
                                itemCount: dataKategori.length,
                                itemBuilder: (context, index) {
                                  return ShaderMask(
                                    shaderCallback: (bounds) {
                                      return LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black,
                                          Colors.black,
                                          Colors.transparent,
                                        ],
                                        stops: [0, 0.02, 0.98, 1],
                                      ).createShader(bounds);
                                    },
                                    blendMode: BlendMode.dstIn,
                                    child: Material(
                                      color: index % 2 == 0
                                          ? const Color.fromARGB(
                                              255,
                                              235,
                                              235,
                                              235,
                                            )
                                          : const Color.fromARGB(
                                              255,
                                              221,
                                              221,
                                              221,
                                            ),
                                      child: InkWell(
                                        onTap: () {
                                          context.read<InventoryBloc>().add(
                                            InvSelectedKategori(
                                              selectedKategori:
                                                  dataKategori[index],
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 10,
                                            bottom: 10,
                                          ),

                                          child: Text(
                                            dataKategori[index].getnamaKategori,
                                            style: lv1TextStyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                  ),
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
                        context.read<InventoryBloc>().add(ResetKategoriForm());
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
                        context.read<InventoryBloc>().add(ResetItemForm());
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
                                    idCabang:
                                        (context.read<InventoryBloc>().state
                                                as InventoryLoaded)
                                            .idCabang!,
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
                                  child:
                                      BlocSelector<
                                        InventoryBloc,
                                        InventoryState,
                                        bool
                                      >(
                                        selector: (state) {
                                          if (state is InventoryLoaded) {
                                            return state.condimentForm ?? false;
                                          }
                                          return false;
                                        },
                                        builder: (contextBloc, state) {
                                          return GestureDetector(
                                            onTap: () => context
                                                .read<InventoryBloc>()
                                                .add(
                                                  CondimentForm(
                                                    condimentForm: !state,
                                                  ),
                                                ),
                                            child: AnimatedContainer(
                                              duration: Duration(
                                                milliseconds: 500,
                                              ),
                                              width: 135,
                                              padding: EdgeInsets.only(
                                                top: 5,
                                                bottom: 5,
                                              ),
                                              height: 35,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                color: state
                                                    ? AppColor.primary
                                                    : Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        (state
                                                                ? Colors.black
                                                                : Colors.green)
                                                            .withValues(
                                                              alpha: 0.4,
                                                            ),
                                                    blurStyle: BlurStyle.outer,
                                                    blurRadius: 15,
                                                  ),
                                                ],
                                              ),
                                              child: Stack(
                                                children: [
                                                  AnimatedPositioned(
                                                    curve: Curves.easeInOut,
                                                    left: state ? -50 : 5,
                                                    duration: Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .check_circle_outline_rounded,
                                                      size: 25,
                                                    ),
                                                  ),
                                                  AnimatedPositioned(
                                                    curve: Curves.easeInOut,
                                                    left: state ? 100 : 150,
                                                    duration: Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .check_circle_outline_rounded,
                                                      size: 25,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  AnimatedPositioned(
                                                    curve: Curves.easeInOut,
                                                    top: 2,
                                                    left: state ? -100 : 38,
                                                    duration: Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    child: Text(
                                                      "Normal",
                                                      style: lv1TextStyle,
                                                    ),
                                                  ),
                                                  AnimatedPositioned(
                                                    curve: Curves.easeInOut,
                                                    left: state ? 10 : 150,
                                                    top: 2,
                                                    duration: Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Condiment",
                                                        style:
                                                            lv1TextStyleWhite,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
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
                              Expanded(
                                child:
                                    BlocSelector<
                                      InventoryBloc,
                                      InventoryState,
                                      (List<ModelKategori>?, ModelKategori?)
                                    >(
                                      selector: (state) {
                                        if (state is InventoryLoaded) {
                                          return (
                                            state.dataKategori,
                                            state.dataSelectedKategoriItem,
                                          );
                                        }
                                        return (null, null);
                                      },
                                      builder: (contextBloc, stateBLoc) {
                                        if (stateBLoc.$1 == null) {
                                          return const SpinKitThreeBounce(
                                            color: Colors.blue,
                                            size: 30.0,
                                          );
                                        }
                                        final blocState = contextBloc
                                            .read<InventoryBloc>()
                                            .state;
                                        final idCabang =
                                            blocState is InventoryLoaded
                                            ? blocState.idCabang
                                            : "";
                                        final initselection =
                                            stateBLoc.$2 != null
                                            ? stateBLoc.$1!.firstWhere((
                                                element,
                                              ) {
                                                return element.getidKategori ==
                                                    stateBLoc.$2!.getidKategori;
                                              })
                                            : null;
                                        print(
                                          "dataSelectedItemKategori: ${initselection?.getnamaKategori} ${stateBLoc.$2?.getidKategori}",
                                        );
                                        return DropdownMenuFormField<
                                          ModelKategori?
                                        >(
                                          initialSelection: initselection,
                                          textStyle: lv05TextStyle,
                                          label: Text(
                                            "Kategori...",
                                            style: lv05TextStyle,
                                          ),
                                          dropdownMenuEntries: stateBLoc.$1!
                                              .where(
                                                (data) =>
                                                    data.getidCabang ==
                                                    idCabang,
                                              )
                                              .map(
                                                (map) =>
                                                    DropdownMenuEntry<
                                                      ModelKategori
                                                    >(
                                                      value: map,
                                                      label:
                                                          map.getnamaKategori,
                                                    ),
                                              )
                                              .toList(),
                                          onSelected: (value) {
                                            context.read<InventoryBloc>().add(
                                              InvSelectedKategoriItem(
                                                dataKategoriItem: value!,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                              ),
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
                                final bloc = context
                                    .read<InventoryBloc>()
                                    .state;
                                if (bloc is InventoryLoaded) {
                                  if (bloc.dataSelectedItem != null) {
                                    context.read<InventoryBloc>().add(
                                      UploadItem(
                                        data: bloc.updateDataSelectedItem!,
                                      ),
                                    );
                                  } else {
                                    final data = ModelItem(
                                      qtyItem: 0,
                                      uidUser: UserSession.uidUser!,
                                      namaItem: namaItemController.text,
                                      idItem: Uuid().v4(),
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
                                      UploadItem(data: data),
                                    );
                                  }
                                  _resetItemForm();
                                }
                              }
                            },
                            label: Text(
                              context.select<InventoryBloc, bool>((bloc) {
                                    final state = bloc.state;
                                    if (state is InventoryLoaded) {
                                      return state.dataSelectedItem != null
                                          ? true
                                          : false;
                                    }
                                    return false;
                                  })
                                  ? "Edit"
                                  : "Simpan",
                              style: lv1TextStyleWhite,
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
                                  UploadKategori(data: pushKategori),
                                );

                                namaKategoriController.clear();
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
        "toContext": const UiInventory(),
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
    context.read<InventoryBloc>().add(ResetItemForm());
    namaItemController.clear();
    hargaItemController.clear();
    kodeBarcodeController.clear();
    selectedIdKategori = null;
  }
}
