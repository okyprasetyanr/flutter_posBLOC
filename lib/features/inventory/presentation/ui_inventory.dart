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
import 'package:flutter_pos/template_responsif/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/widget_navigation_gesture.dart';
import 'package:flutter_pos/widget/widget_snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

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
  String? selectedFilterItem;
  String? selectedStatusItem;
  String? selectedIdKategori;

  bool checkcondiment = false;
  bool condiment = false;
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

    final bloc = context.read<InventoryBloc>();
    bloc.add(
      AmbilData(
        idCabang: null,
        filter: selectedFilterItem!,
        status: selectedStatusItem!,
        statusCondiment: checkcondiment,
      ),
    );
  }

  Future<void> _onRefresh() async {
    _initData();
  }

  @override
  Widget build(BuildContext context) {
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
            GestureDetector(
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
                  Row(
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
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            iconColor: WidgetStatePropertyAll(
                              checkcondiment ? Colors.white : Colors.black,
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              checkcondiment ? AppColor.primary : Colors.white,
                            ),
                            padding: WidgetStatePropertyAll(EdgeInsets.zero),
                          ),
                          onPressed: () {
                            setState(() {
                              checkcondiment = !checkcondiment;
                              context.read<InventoryBloc>().add(
                                FilterItem(
                                  statusCondiment: checkcondiment,
                                  filter: selectedFilterItem!,
                                  status: selectedStatusItem!,
                                  idCabang:
                                      (context.read<InventoryBloc>().state
                                              as InventoryLoaded)
                                          .idCabang!,
                                ),
                              );
                            });
                          },
                          label: Text(
                            "Condiment",
                            style: checkcondiment
                                ? lv1TextStyleWhite
                                : lv1TextStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          icon: Icon(Icons.check_rounded),
                        ),
                      ),
                    ],
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
                                  FilterItem(
                                    idCabang:
                                        (context.read<InventoryBloc>().state
                                                as InventoryLoaded)
                                            .idCabang!,
                                    filter: selectedFilterItem!,
                                    status: selectedStatusItem!,
                                    statusCondiment: checkcondiment,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            fit: FlexFit.loose,
                            flex: 2,
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
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return DropdownButtonFormField<ModelCabang>(
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
                                        String idCabang = value!.getidCabang;
                                        context.read<InventoryBloc>().add(
                                          AmbilData(
                                            idCabang: idCabang,
                                            filter: selectedFilterItem!,
                                            status: selectedStatusItem!,
                                            statusCondiment: checkcondiment,
                                          ),
                                        );
                                      },
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
                                  FilterItem(
                                    idCabang:
                                        (context.read<InventoryBloc>().state
                                                as InventoryLoaded)
                                            .idCabang!,
                                    filter: selectedFilterItem!,
                                    status: selectedStatusItem!,
                                    statusCondiment: checkcondiment,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                        BlocSelector<
                          InventoryBloc,
                          InventoryState,
                          List<ModelItem>
                        >(
                          selector: (state) {
                            if (state is InventoryLoaded) {
                              return state.filteredDataItem;
                            }
                            return [];
                          },
                          builder: (contextBloc, state) {
                            final items = state
                                .where(
                                  (data) =>
                                      data.getidCabang ==
                                      contextBloc.select<
                                        InventoryBloc,
                                        String?
                                      >((data) {
                                        return data.state is InventoryLoaded
                                            ? (data.state as InventoryLoaded)
                                                  .idCabang
                                            : "";
                                      }),
                                )
                                .toList();
                            return GridView.builder(
                              itemCount: items.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 2 / 3,
                                  ),
                              itemBuilder: (context, index) {
                                return Material(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  elevation: 4,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15),
                                    onTap: () {
                                      namaItemController.text =
                                          items[index].getnamaItem;
                                      kodeBarcodeController.text =
                                          items[index].getBarcode;
                                      hargaItemController.text =
                                          items[index].gethargaItem;
                                      condiment =
                                          items[index].getstatusCondiment;
                                      context.read<InventoryBloc>().add(
                                        SelectedItem(
                                          selecteditem: {
                                            "id_item": items[index].getidItem,
                                          },
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/logo.png",
                                          height: 40,
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
                                            style: lv05TextStyle,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),

                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            formatQty(items[index].getqtyitem),
                                            style: lv0TextStyleRED,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
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
                              return const Center(
                                child: CircularProgressIndicator(),
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
                                  AmbilData(
                                    filter: selectedFilterItem!,
                                    status: selectedStatusItem!,
                                    idCabang: value!.getidCabang,
                                    statusCondiment: checkcondiment,
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
                          (List<ModelKategori> data, String? selectedIDCabang)
                        >(
                          selector: (state) => state is InventoryLoaded
                              ? (state.dataKategori, state.idCabang)
                              : ([], ""),
                          builder: (context, state) {
                            final dataKategori = state.$1
                                .where((data) => data.getidCabang == state.$2)
                                .toList();
                            if (dataKategori.isEmpty) {
                              return Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Data Kosong!",
                                  style: lv1TextStyle,
                                ),
                              );
                            }
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
                                            SelectedKategori(
                                              selectedKategori: {
                                                "nama_kategori":
                                                    dataKategori[index]
                                                        .getnamaKategori,
                                                "id_kategori":
                                                    dataKategori[index]
                                                        .getidKategori,
                                              },
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
        Align(
          alignment: Alignment.topRight,
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
                    right: currentPage ? 0 : 350,
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
                        customTextField("Nama Item", namaItemController),
                        const SizedBox(height: 10),
                        customTextField("Kode/Barcode", kodeBarcodeController),
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
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => condiment = !condiment),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  width: 135,
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: condiment
                                        ? AppColor.primary
                                        : Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            (condiment
                                                    ? Colors.black
                                                    : Colors.green)
                                                .withValues(alpha: 0.4),
                                        blurStyle: BlurStyle.outer,
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      AnimatedPositioned(
                                        curve: Curves.easeInOut,
                                        left: condiment ? -50 : 5,
                                        duration: Duration(milliseconds: 500),
                                        child: Icon(
                                          Icons.check_circle_outline_rounded,
                                          size: 25,
                                        ),
                                      ),
                                      AnimatedPositioned(
                                        curve: Curves.easeInOut,
                                        left: condiment ? 100 : 150,
                                        duration: Duration(milliseconds: 500),
                                        child: Icon(
                                          Icons.check_circle_outline_rounded,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                      AnimatedPositioned(
                                        curve: Curves.easeInOut,
                                        top: 2,
                                        left: condiment ? -100 : 38,
                                        duration: Duration(milliseconds: 500),
                                        child: Text(
                                          "Normal",
                                          style: lv1TextStyle,
                                        ),
                                      ),
                                      AnimatedPositioned(
                                        curve: Curves.easeInOut,
                                        left: condiment ? 10 : 150,
                                        top: 2,
                                        duration: Duration(milliseconds: 500),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Condiment",
                                            style: lv1TextStyleWhite,
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
                                      List<ModelKategori>?
                                    >(
                                      selector: (state) {
                                        if (state is InventoryLoaded) {
                                          return state.dataKategori;
                                        }
                                        return null;
                                      },
                                      builder: (contextBloc, state) {
                                        return DropdownButtonFormField<
                                          ModelKategori
                                        >(
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
                                            "Kategori...",
                                            style: lv05TextStyle,
                                          ),
                                          items: state != null
                                              ? state!
                                                    .where(
                                                      (data) =>
                                                          data.getidCabang ==
                                                          contextBloc.select<
                                                            InventoryBloc,
                                                            String?
                                                          >(
                                                            (data) =>
                                                                data.state
                                                                    is InventoryLoaded
                                                                ? (data.state
                                                                          as InventoryLoaded)
                                                                      .idCabang
                                                                : "",
                                                          ),
                                                    )
                                                    .map(
                                                      (map) =>
                                                          DropdownMenuItem<
                                                            ModelKategori
                                                          >(
                                                            value: map,
                                                            child: Text(
                                                              map.getnamaKategori,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                    )
                                                    .toList()
                                              : [],
                                          onTap: () {
                                            if (state!.isEmpty) {
                                              customSnackBar(
                                                context,
                                                "Cabang tidak memiliki Kategori",
                                              );
                                            }
                                          },
                                          onChanged: (value) {
                                            selectedIdKategori =
                                                value!.getidKategori;
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
                                    text: context
                                        .select<InventoryBloc, String?>(
                                          (value) =>
                                              value.state is InventoryLoaded
                                              ? (value.state as InventoryLoaded)
                                                    .daerahCabang
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
                          child:
                              BlocSelector<
                                InventoryBloc,
                                InventoryState,
                                Map<String, String>?
                              >(
                                selector: (state) {
                                  if (state is InventoryLoaded) {
                                    return state.dataSelectItem;
                                  }
                                  return {};
                                },
                                builder: (context, state) {
                                  return ElevatedButton.icon(
                                    onPressed: () {
                                      if (namaItemController.text.isEmpty ||
                                          hargaItemController.text.isEmpty ||
                                          kodeBarcodeController.text.isEmpty ||
                                          selectedIdKategori == null) {
                                        customSnackBar(
                                          context,
                                          "Data belum lengkap!",
                                        );
                                      } else {
                                        final data = ModelItem(
                                          qtyItem: 0,
                                          uidUser: UserSession.uidUser!,
                                          namaItem: namaItemController.text,
                                          idItem: Uuid().v4(),
                                          hargaItem: hargaItemController.text,
                                          idKategoriItem: selectedIdKategori!,
                                          statusCondiment: condiment,
                                          urlGambar: "",
                                          idCabang:
                                              (context
                                                          .read<InventoryBloc>()
                                                          .state
                                                      as InventoryLoaded)
                                                  .idCabang!,
                                          barcode: kodeBarcodeController.text,
                                          statusItem: true,
                                          tanggalItem: DateFormat(
                                            'yyyy-MM-dd',
                                          ).format(DateTime.now()),
                                        );
                                        context.read<InventoryBloc>().add(
                                          UploadItem(data: data),
                                        );

                                        namaItemController.clear();
                                        kodeBarcodeController.clear();
                                        hargaItemController.clear();
                                        condiment = false;
                                      }
                                    },
                                    label: Text(
                                      state!.isEmpty ? "Simpan" : "Edit",
                                      style: lv1TextStyleWhite,
                                    ),
                                    icon: Icon(Icons.save, color: Colors.white),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 4,
                                      backgroundColor: AppColor.primary,
                                    ),
                                  );
                                },
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
                          listener: (context, state) {
                            state is InventoryLoaded
                                ? namaKategoriController.text =
                                      state
                                          .dataSelectedKategori['nama_kategori'] ??
                                      ""
                                : "";
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
                          Map<String, String>?
                        >(
                          selector: (state) {
                            if (state is InventoryLoaded) {
                              return state.dataSelectedKategori;
                            }
                            return {};
                          },
                          builder: (context, state) {
                            return ElevatedButton.icon(
                              onPressed: () async {
                                if (namaKategoriController.text
                                    .trim()
                                    .isEmpty) {
                                  customSnackBar(
                                    context,
                                    "Nama kategori atau cabang belum dipilih",
                                  );
                                  return;
                                }
                                String idkategori =
                                    state['id_kategori'] ?? const Uuid().v4();
                                Map<String, dynamic> pushKategori = {
                                  "nama_kategori": namaKategoriController.text
                                      .trim(),
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
                                state!.isEmpty ? "Simpan" : "Edit",
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
    namaItemController.clear();
    hargaItemController.clear();
    kodeBarcodeController.clear();
    selectedIdKategori = null;
    condiment = false;
  }
}
