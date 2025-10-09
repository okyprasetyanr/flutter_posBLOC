import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_pesanan.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class UISellPopUpItem extends StatefulWidget {
  const UISellPopUpItem({super.key});

  @override
  State<UISellPopUpItem> createState() => _UISellPopUpItemState();
}

class _UISellPopUpItemState extends State<UISellPopUpItem> {
  ValueNotifier<bool> popup = ValueNotifier(false);
  ValueNotifier<bool> editharga = ValueNotifier(false);
  ValueNotifier<double> jumlah = ValueNotifier<double>(0);
  ValueNotifier<double> hargaItemSelected = ValueNotifier<double>(0);
  ValueNotifier<int> diskonItemSelected = ValueNotifier<int>(0);
  ModelItemPesanan? dataselected;
  List<ModelItemPesanan> condiment = [];
  TextEditingController catatanController = TextEditingController();
  TextEditingController hargaController = TextEditingController();

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
              margin: EdgeInsets.all(10),
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
                    flex: 3,
                    child: Column(
                      children: [
                        Row(
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
                                        style: lv1TextStyle,
                                      );
                                    },
                                  ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Quantity:", style: lv1TextStyle),
                                  ValueListenableBuilder<double>(
                                    valueListenable: jumlah,
                                    builder: (context, value, child) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              jumlah.value--;
                                            },
                                            icon: Icon(Icons.remove, size: 20),
                                          ),
                                          Text(
                                            formatQty(value),
                                            style: lv1TextStyle,
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              jumlah.value++;
                                            },
                                            icon: Icon(Icons.add, size: 20),
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

                        Expanded(
                          child: ValueListenableBuilder<int>(
                            valueListenable: diskonItemSelected,
                            builder: (context, valueDiskon, child) {
                              return ValueListenableBuilder<double>(
                                valueListenable: hargaItemSelected,
                                builder: (context, valueHarga, child) {
                                  double hargafinal = valueHarga == 0
                                      ? (double.tryParse(
                                              dataselected?.gethargaItem ?? "0",
                                            ) ??
                                            0.0)
                                      : (valueHarga *
                                            (100 - valueDiskon) /
                                            100);
                                  ;
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Price: ", style: lv05TextStyle),
                                          ElevatedButton.icon(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              editharga.value = !false;
                                            },
                                            label: Text(
                                              formatUang(hargafinal.toString()),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              // TAMBAHKAN WIDGET INI
                                              height: 50,
                                              child: Stack(
                                                children: [
                                                  ValueListenableBuilder<bool>(
                                                    valueListenable: editharga,
                                                    builder:
                                                        (
                                                          context,
                                                          valueEditHarga,
                                                          child,
                                                        ) {
                                                          return AnimatedPositioned(
                                                            left: valueEditHarga
                                                                ? 0
                                                                : -200,
                                                            right: 0,
                                                            duration: Duration(
                                                              milliseconds: 800,
                                                            ),
                                                            child: TextField(
                                                              controller:
                                                                  hargaController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              onChanged: (value) {
                                                                hargaItemSelected
                                                                        .value =
                                                                    double.tryParse(
                                                                      value.isEmpty
                                                                          ? "0"
                                                                          : value,
                                                                    ) ??
                                                                    0.0;
                                                              },
                                                            ),
                                                          );
                                                        },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Expanded(
                                        child: SegmentedButton<int>(
                                          segments: const [
                                            ButtonSegment(
                                              value: 10,
                                              label: Text('10%'),
                                            ),
                                            ButtonSegment(
                                              value: 50,
                                              label: Text('50%'),
                                            ),
                                            ButtonSegment(
                                              value: 100,
                                              label: Text('100%'),
                                            ),
                                          ],
                                          selected: {valueDiskon},
                                          onSelectionChanged: (value) {
                                            diskonItemSelected.value =
                                                value.first;
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            style: lv05TextStyle,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: "Catatan...",
                              hintStyle: lv05TextStyle,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            controller: catatanController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
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
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.card_giftcard_rounded),
                              label: Text(
                                "Free/Bonus",
                                style: lv1TextStyleWhite,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),

                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
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
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.delete_forever_rounded),
                              label: Text("Hapus", style: lv1TextStyleWhite),
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
                            child: ElevatedButton.icon(
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
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.close_rounded),
                              label: Text("Tutup", style: lv1TextStyleWhite),
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
                            child: ElevatedButton.icon(
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
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.edit_note_rounded),
                              label: Text("Simpan", style: lv1TextStyleWhite),
                              onPressed: () {
                                final updatedItem = ModelItemPesanan(
                                  idCabang: dataselected!.getidCabang,
                                  namaItem: dataselected!.getnamaItem,
                                  idItem: dataselected!.getidItem,
                                  idPesanan: dataselected!.getidPesanan,
                                  qtyItem: jumlah.value,
                                  hargaItem: hargaItemSelected.toString(),
                                  diskonItem: diskonItemSelected.toString(),
                                  idKategoriItem: dataselected!.getnamaItem,
                                  idCondimen: dataselected!.getidCondimen,
                                  catatan: catatanController.text,
                                  urlGambar: dataselected!.geturlGambar,
                                  condiment: condiment,
                                );
                                popup.value = !isVisible;
                                final bloc = context.read<SellBloc>().state;
                                final cekItem = bloc is SellLoaded
                                    ? (bloc).itemPesanan
                                    : [];
                                if (cekItem!.isNotEmpty) {
                                  if (cekItem
                                      .where(
                                        (element) =>
                                            element.getidPesanan ==
                                            dataselected!.getidPesanan,
                                      )
                                      .isNotEmpty) {
                                    context.read<SellBloc>().add(
                                      SellUpdateOrderedItem(
                                        updatedItem: updatedItem,
                                      ),
                                    );
                                  }
                                }
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
