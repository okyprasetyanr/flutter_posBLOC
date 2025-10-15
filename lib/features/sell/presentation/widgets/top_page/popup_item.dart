import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_pesanan.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';

class UISellPopUpItem extends StatefulWidget {
  const UISellPopUpItem({super.key});

  @override
  State<UISellPopUpItem> createState() => _UISellPopUpItemState();
}

class _UISellPopUpItemState extends State<UISellPopUpItem> {
  ValueNotifier<bool> popup = ValueNotifier(false);
  ValueNotifier<bool> editharga = ValueNotifier(false);
  ValueNotifier<double> jumlah = ValueNotifier<double>(0);
  ValueNotifier<int> hargaItemSelected = ValueNotifier<int>(0);
  ValueNotifier<int> diskonItemSelected = ValueNotifier<int>(0);
  ModelItemPesanan? dataselected;
  List<ModelItemPesanan> condiment = [];
  TextEditingController catatanController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController customDiscountController = TextEditingController();
  PageController pageController = PageController();
  bool currentPage = true;
  double hargafinal = 0;
  List<ModelItemPesanan> itemCondiment = [];

  void _gotoPage(bool page) {
    int goto = page ? 0 : 1;

    if (pageController.hasClients) {
      pageController.animateToPage(
        goto,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    setState(() {
      currentPage = page;
    });
  }

  @override
  void dispose() {
    popup.dispose();
    editharga.dispose();
    jumlah.dispose();
    hargaItemSelected.dispose();
    diskonItemSelected.dispose();
    catatanController.dispose();
    hargaController.dispose();
    customDiscountController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SellBloc, SellState>(
      listener: (context, state) {
        if (state is SellLoaded) {
          if (state.selectedItem == null) {
            return;
          }
          final data = state.selectedItem;
          dataselected = data;
          popup.value = data != null ? true : false;
          jumlah.value = data!.getqtyItem;
        }
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: popup,
        builder: (_, isVisible, __) {
          return AnimatedPositioned(
            top: isVisible ? 60 : 800,
            left: 0,
            right: 0,
            bottom: 0,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500),
            child: Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 0),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: PageView(
                      controller: pageController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child:
                                          BlocSelector<
                                            SellBloc,
                                            SellState,
                                            ModelItemPesanan?
                                          >(
                                            selector: (stateNama) {
                                              if (stateNama is SellLoaded) {
                                                return stateNama.selectedItem;
                                              }
                                              return null;
                                            },
                                            builder: (context, stateNama) {
                                              return Text(
                                                stateNama?.getnamaItem ?? "",
                                                style: lv05TextStyle,
                                              );
                                            },
                                          ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Quantity:",
                                            style: lv05TextStyle,
                                          ),
                                          BlocSelector<
                                            SellBloc,
                                            SellState,
                                            double?
                                          >(
                                            selector: (state) {
                                              if (state is SellLoaded) {
                                                return state
                                                    .selectedItem
                                                    ?.getqtyItem;
                                              }
                                              return null;
                                            },
                                            builder: (context, state) {
                                              if (state == null) {
                                                return SizedBox.shrink();
                                                ;
                                              }
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {
                                                      context
                                                          .read<SellBloc>()
                                                          .add(
                                                            SellAdjustQtyItem(
                                                              mode: false,
                                                            ),
                                                          );
                                                    },
                                                    icon: Icon(
                                                      Icons.remove,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    formatQty(state),
                                                    style: lv1TextStyle,
                                                  ),
                                                  SizedBox(width: 10),
                                                  IconButton(
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {
                                                      context
                                                          .read<SellBloc>()
                                                          .add(
                                                            SellAdjustQtyItem(
                                                              mode: true,
                                                            ),
                                                          );
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                style: lv05TextStyle,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  labelText: "Catatan",
                                  labelStyle: lv05TextStyle,
                                  contentPadding: EdgeInsets.zero,
                                  hintText: "Catatan...",
                                  hintStyle: lv05TextStyle,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                controller: catatanController,
                              ),
                              const SizedBox(height: 10),
                              ValueListenableBuilder<int>(
                                valueListenable: diskonItemSelected,
                                builder: (context, valueDiskon, child) {
                                  return ValueListenableBuilder<int>(
                                    valueListenable: hargaItemSelected,
                                    builder: (context, valueHarga, child) {
                                      hargafinal = valueHarga == 0
                                          ? ((dataselected?.gethargaItem ??
                                                    0.0) *
                                                (100 - valueDiskon) /
                                                100)
                                          : (valueHarga *
                                                (100 - valueDiskon) /
                                                100);
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Harga: ",
                                                    style: lv05TextStyle,
                                                  ),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        width: double.infinity,
                                                        child: ElevatedButton.icon(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                WidgetStatePropertyAll(
                                                                  Colors.white,
                                                                ),
                                                            padding:
                                                                WidgetStatePropertyAll(
                                                                  EdgeInsets
                                                                      .zero,
                                                                ),
                                                          ),
                                                          iconAlignment:
                                                              IconAlignment.end,
                                                          icon: Icon(
                                                            Icons.edit,
                                                          ),
                                                          onPressed: () {
                                                            editharga.value =
                                                                !editharga
                                                                    .value;
                                                          },
                                                          label: Text(
                                                            formatUang(
                                                              hargafinal,
                                                            ),
                                                            style:
                                                                lv05TextStyle,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 25,
                                                        width: 120,
                                                        child: Stack(
                                                          children: [
                                                            ValueListenableBuilder<
                                                              bool
                                                            >(
                                                              valueListenable:
                                                                  editharga,
                                                              builder:
                                                                  (
                                                                    context,
                                                                    valueEditHarga,
                                                                    child,
                                                                  ) {
                                                                    return AnimatedPositioned(
                                                                      bottom: 0,
                                                                      top:
                                                                          valueEditHarga
                                                                          ? 0
                                                                          : -80,
                                                                      left: 0,
                                                                      right: 0,
                                                                      duration: Duration(
                                                                        milliseconds:
                                                                            500,
                                                                      ),
                                                                      child: SizedBox(
                                                                        width:
                                                                            200,
                                                                        child: TextField(
                                                                          decoration: InputDecoration(
                                                                            labelText:
                                                                                "Edit Harga:",
                                                                            labelStyle:
                                                                                lv05TextStyle,
                                                                            hintText:
                                                                                "Rp...",
                                                                            hintStyle:
                                                                                lv05TextStyle,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.right,
                                                                          controller:
                                                                              hargaController,
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          onChanged:
                                                                              (
                                                                                value,
                                                                              ) {
                                                                                hargaItemSelected.value =
                                                                                    int.tryParse(
                                                                                      value.isEmpty
                                                                                          ? "0"
                                                                                          : value,
                                                                                    ) ??
                                                                                    0;
                                                                              },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  SizedBox(
                                                    child: TextField(
                                                      controller:
                                                          customDiscountController,
                                                      textAlign:
                                                          TextAlign.right,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      style: lv05TextStyle,
                                                      decoration: InputDecoration(
                                                        suffixText: "%",
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .always,
                                                        border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                5,
                                                              ),
                                                        ),
                                                        labelText:
                                                            "Custom Disc",
                                                        labelStyle:
                                                            lv05TextStyle,
                                                      ),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .digitsOnly,
                                                        TextInputFormatter.withFunction((
                                                          oldValue,
                                                          newValue,
                                                        ) {
                                                          final text =
                                                              newValue.text;
                                                          final intValue =
                                                              int.tryParse(
                                                                text.isEmpty
                                                                    ? "0"
                                                                    : text,
                                                              ) ??
                                                              0;
                                                          if (intValue > 100) {
                                                            customSnackBar(
                                                              context,
                                                              "Jumlah melebihi 100%",
                                                            );
                                                            return oldValue;
                                                          }
                                                          if (text.isEmpty) {
                                                            diskonItemSelected
                                                                    .value =
                                                                0;
                                                            return newValue;
                                                          }
                                                          diskonItemSelected
                                                                  .value =
                                                              intValue;
                                                          return newValue;
                                                        }),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Diskon:",
                                                    style: lv05TextStyle,
                                                  ),
                                                  const SizedBox(height: 8),
                                                  ValueListenableBuilder<int>(
                                                    valueListenable:
                                                        diskonItemSelected,
                                                    builder: (context, selectedValue, _) {
                                                      final diskonList = [
                                                        10,
                                                        25,
                                                        50,
                                                      ];
                                                      return Column(
                                                        children: diskonList.map((
                                                          diskon,
                                                        ) {
                                                          final isSelected =
                                                              selectedValue ==
                                                              diskon;
                                                          return ElevatedButton.icon(
                                                            onPressed: () {
                                                              diskonItemSelected
                                                                      .value =
                                                                  isSelected
                                                                  ? 0
                                                                  : diskon;
                                                            },
                                                            icon: const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                            ),
                                                            label: Text(
                                                              "$diskon%",
                                                              style: isSelected
                                                                  ? lv05TextStyleWhite
                                                                  : lv05TextStyle,
                                                            ),
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  WidgetStatePropertyAll(
                                                                    isSelected
                                                                        ? AppColor
                                                                              .primary
                                                                        : Colors
                                                                              .white,
                                                                  ),
                                                              iconColor: WidgetStatePropertyAll(
                                                                isSelected
                                                                    ? Colors
                                                                          .white
                                                                    : Colors
                                                                          .black,
                                                              ),
                                                            ),
                                                          );
                                                        }).toList(),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        BlocSelector<SellBloc, SellState, List<ModelItem>>(
                          selector: (state) {
                            if (state is SellLoaded) {
                              return state.dataItem
                                      ?.where(
                                        (element) => element.getstatusCondiment,
                                      )
                                      .toList() ??
                                  [];
                            }
                            return [];
                          },
                          builder: (context, state) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),

                                color: Colors.grey.shade200,
                              ),
                              child: Column(
                                children: [
                                  Text("Condiment", style: labelTextStyle),
                                  Expanded(
                                    child: GridView.builder(
                                      itemCount: state.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 1,
                                            mainAxisExtent: 50,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                          ),
                                      itemBuilder: (context, index) {
                                        return BlocSelector<
                                          SellBloc,
                                          SellState,
                                          (
                                            String?,
                                            List<ModelItemPesanan>?,
                                            String?,
                                          )
                                        >(
                                          selector: (state) {
                                            if (state is SellLoaded) {
                                              return (
                                                state
                                                    .selectedItem
                                                    ?.getidPesanan,
                                                state
                                                    .selectedItem
                                                    ?.getCondiment,
                                                state
                                                    .selectedItem
                                                    ?.getidCondimen,
                                              );
                                            }
                                            return ("", [], "");
                                          },
                                          builder: (context, stateCondiment) {
                                            if (stateCondiment.$1 == null) {
                                              return Spacer();
                                            }
                                            double qtyitem = 0;
                                            bool? cekCondiment = stateCondiment
                                                .$2!
                                                .any(
                                                  (element) =>
                                                      state[index].getidItem ==
                                                      element.getidItem,
                                                );

                                            if (cekCondiment) {
                                              qtyitem = stateCondiment.$2!
                                                  .firstWhere(
                                                    (element) =>
                                                        state[index]
                                                            .getidItem ==
                                                        element.getidItem,
                                                  )
                                                  .getqtyItem;
                                            }
                                            return Material(
                                              elevation: 4,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                onTap: () {
                                                  ModelItemPesanan
                                                  selectedItemCondiment =
                                                      ModelItemPesanan(
                                                        idCabang: state[index]
                                                            .getidCabang,
                                                        namaItem: state[index]
                                                            .getnamaItem,
                                                        idItem: state[index]
                                                            .getidItem,
                                                        idPesanan:
                                                            stateCondiment.$1!,
                                                        qtyItem: qtyitem + 1,
                                                        hargaItem: state[index]
                                                            .gethargaItem,
                                                        diskonItem: "0",
                                                        idKategoriItem:
                                                            state[index]
                                                                .getidKategoriItem,
                                                        idCondimen:
                                                            stateCondiment.$3!,
                                                        catatan: "",
                                                        urlGambar: "",
                                                        condiment: [],
                                                      );
                                                  context.read<SellBloc>().add(
                                                    SellSelectedCondiment(
                                                      selectedCondiment:
                                                          selectedItemCondiment,
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        state[index]
                                                            .getnamaItem,
                                                        style: lv05TextStyle,
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        "${formatQty(qtyitem)}x",
                                                        style: lv05TextStyleRed,
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 60,
                    height: 260,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.all(10),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 255, 154, 72),
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      15,
                                    ),
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.fastfood_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                _gotoPage(!currentPage);
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.all(10),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 255, 89, 78),
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      15,
                                    ),
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.delete_forever_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                popup.value = !isVisible;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.all(10),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.red,
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      15,
                                    ),
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                popup.value = false;
                                context.read<SellBloc>().add(
                                  SellResetSelectedItem(),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  AppColor.primary,
                                ),
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.all(10),
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      15,
                                    ),
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                ;
                                popup.value = !isVisible;
                                context.read<SellBloc>().add(
                                  SellAddOrderedItem(),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
