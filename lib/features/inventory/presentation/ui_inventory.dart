import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template_responsif/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/widget_navigation_gesture.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = context.read<InventoryBloc>();
      bloc.add(AmbilCabang());
    });
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
                  onChanged: (value) {},
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
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocSelector<InventoryBloc, InventoryState, List<ModelCabang>>(
            selector: (state) {
              if (state is InventoryLoaded) {
                return state.datacabang;
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
                      Text(state[index].getdaerahCabang, style: lv05TextStyle),
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
}
