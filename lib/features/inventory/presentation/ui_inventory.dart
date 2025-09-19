import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template_responsif/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/widget_navigation_gesture.dart';
import 'package:flutter_pos/widget/widget_snack_bar.dart';
import 'package:provider/provider.dart';

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
  String? selectedkategori;
  String? selectedIdkategori;

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
    final bloc = context.read<InventoryBloc>();
    bloc.add(AmbilData());

    final blocInitItem = context.read<InventoryBloc>();
    blocInitItem.add(
      FilterItem(filter: statusItem.first, status: filters.first),
    );

    final blocInitKategori = context.read<InventoryBloc>().state;
    if (blocInitKategori is InventoryLoaded) {
      context.read<InventoryBloc>().add(
        FilterCategory(idCabang: blocInitKategori.idCabang!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
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
                  contentPadding: EdgeInsets.only(left: 10, right: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text("Condiment", style: lv05TextStyle),
                icon: Icon(Icons.check_rounded),
              ),
            ),
          ],
        ),
        Flexible(
          child: Row(
            children: [
              Flexible(
                //FilterItem
                flex: 1,
                fit: FlexFit.loose,
                child: DropdownButtonFormField(
                  initialValue: filters.first,
                  items: filters
                      .map(
                        (map) => DropdownMenuItem(
                          value: map,
                          child: Text(map, style: lv05TextStyle),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    selectedFilterItem = value;
                    final bloc = context.read<InventoryBloc>();
                    bloc.add(
                      FilterItem(
                        filter: selectedFilterItem!,
                        status: selectedStatusItem!,
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
                      List<ModelCabang>
                    >(
                      selector: (state) {
                        if (state is InventoryLoaded) {
                          return state.datacabang;
                        }
                        return [];
                      },
                      builder: (context, state) {
                        if (state.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return DropdownButtonFormField<ModelCabang>(
                          initialValue: state.first,
                          items: state
                              .map(
                                (map) => DropdownMenuItem(
                                  value: map,
                                  child: Text(map.getdaerahCabang),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
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
                  initialValue: statusItem.first,
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
                        filter: selectedFilterItem!,
                        status: selectedStatusItem!,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocSelector<InventoryBloc, InventoryState, List<ModelItem>>(
            selector: (state) {
              if (state is InventoryFilteredItem) {
                return state.dataItem;
              }
              return [];
            },
            builder: (context, state) {
              return GridView.builder(
                itemCount: state.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset("assetes/logo.png"),
                      const SizedBox(height: 5),
                      Text(
                        state[index].getnamaItem,
                        style: lv05TextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        state[index].gethargaItem,
                        style: lv05TextStyle,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        state[index].getqtyitem.toString(),
                        style: lv0TextStyleRED,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  );
                },
              );
            },
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
                      onPressed: () {},
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
                      onPressed: () {},
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
        customTextField("Nama Item", namaItemController),
        const SizedBox(height: 10),
        customTextField("Kode/Barcode", kodeBarcodeController),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: customTextField("Harga", hargaItemController),
            ),
            const SizedBox(width: 20),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: GestureDetector(
                onTap: () => setState(() => condiment = !condiment),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 135,
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: condiment ? AppColor.primary : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: (condiment ? Colors.black : Colors.green)
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
                        child: Text("Normal", style: lv1TextStyle),
                      ),
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        left: condiment ? 10 : 150,
                        top: 2,
                        duration: Duration(milliseconds: 500),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Condiment", style: lv1TextStyleWhite),
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
                      List<ModelKategori>
                    >(
                      selector: (state) {
                        if (state is InventoryFilteredCategory) {
                          return state.dataKategori;
                        }
                        return [];
                      },
                      builder: (context, state) {
                        return DropdownButtonFormField<ModelKategori>(
                          style: lv05TextStyle,
                          decoration: InputDecoration(
                            label: Text("Pilih Kategori", style: lv1TextStyle),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          hint: Text(
                            state.isNotEmpty
                                ? state.first.getnamaKategori
                                : "Pilih Kategori",
                            style: lv1TextStyle,
                          ),
                          items: state
                              .map(
                                (map) => DropdownMenuItem<ModelKategori>(
                                  value: map,
                                  child: Text(map.getnamaKategori),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            selectedkategori = value!.getnamaKategori;
                            selectedIdkategori = value.getidKategori;
                          },
                        );
                      },
                    ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: BlocSelector<InventoryBloc, InventoryState, String?>(
                  selector: (state) {
                    if (state is InventoryLoaded) {
                      return state.daerahCabang;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    if (state == null) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    cabangItemController.text = state;
                    return TextField(
                      style: lv1TextStyleDisable,
                      enabled: false,
                      controller: cabangItemController,
                      decoration: const InputDecoration(
                        labelText: "Cabang",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          flex: 1,
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
                        selectedkategori == null) {
                      customSnackBar(context, "Data belum lengkap!");
                    } else {}
                  },
                  label: Text("Simpan", style: lv1TextStyleWhite),
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
        label: Text(text, style: lv05TextStyle),
        hint: Text("$text...", style: lv05TextStyle),
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
