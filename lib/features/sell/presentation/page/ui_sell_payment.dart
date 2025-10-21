import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_state.dart';
import 'package:flutter_pos/model_data/model_transaction_sell.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UISellPayment extends StatefulWidget {
  const UISellPayment({super.key});

  @override
  State<UISellPayment> createState() => _UISellPaymentState();
}

class _UISellPaymentState extends State<UISellPayment> {
  final customDiscountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<PaymentBloc>().add(PaymentGetItem());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: refreshIndicator,
    );
  }

  Widget layoutTop() {
    return Column(
      children: [
        Text("Pembayaran", style: titleTextStyle),
        Expanded(
          child: BlocSelector<PaymentBloc, PaymentState, ModelTransactionSell?>(
            selector: (state) {
              if (state is PaymentLoaded) {
                return state.transaction_sell!;
              }
              return null;
            },
            builder: (context, state) {
              if (state == null) {
                return const SpinKitThreeBounce(color: Colors.blue, size: 30.0);
              }
              return Column(
                children: [
                  _rowContent("Tanggal", "${state.getdate}"),
                  const SizedBox(height: 10),
                  _rowContent("Nomor Faktur", "${state.getinvoice}"),
                  const SizedBox(height: 10),
                  _rowContent("Customer", "${state.getnameCustomer}"),
                  const SizedBox(height: 10),
                  _rowContent("Operator", "${state.getnameOperator}"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text("Diskon", style: lv1TextStyle),
                      ),
                      Text(":", style: lv1TextStyle),
                      Row(
                        children: [
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [10, 25, 50].map((diskon) {
                              final isSelected = state.getdiscount == diskon;
                              return ElevatedButton.icon(
                                onPressed: () {
                                  if (customDiscountController
                                      .text
                                      .isNotEmpty) {
                                    customDiscountController.clear();
                                  }
                                  context.read<PaymentBloc>().add(
                                    PaymentAdjust(discount: diskon),
                                  );
                                },
                                icon: const Icon(Icons.check_rounded, size: 15),
                                label: Text(
                                  "$diskon%",
                                  style: isSelected
                                      ? lv05TextStyleWhite
                                      : lv05TextStyle,
                                ),
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(10),
                                    ),
                                  ),
                                  minimumSize: WidgetStatePropertyAll(
                                    Size(0, 0),
                                  ),
                                  padding: const WidgetStatePropertyAll(
                                    EdgeInsets.all(7),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    isSelected
                                        ? AppColor.primary
                                        : Colors.white,
                                  ),
                                  iconColor: WidgetStatePropertyAll(
                                    isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: 50,
                        child: TextField(
                          controller: customDiscountController,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          style: lv05TextStyle,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(10),
                            suffixText: "%",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Ubah Diskon",
                            labelStyle: lv05TextStyle,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TextInputFormatter.withFunction((
                              oldValue,
                              newValue,
                            ) {
                              final customDiscount = newValue.text;
                              final intValue =
                                  int.tryParse(
                                    customDiscount.isEmpty
                                        ? "0"
                                        : customDiscount,
                                  ) ??
                                  0;
                              if (intValue > 100) {
                                customSnackBar(context, "Jumlah melebihi 100%");
                                return oldValue;
                              }
                              context.read<PaymentBloc>().add(
                                PaymentAdjust(discount: intValue),
                              );
                              return newValue;
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _rowContent("PPN", "-"),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Column(
              children: [
                _rowContentDetail("Total Item", "Rp100.000,00"),
                const SizedBox(height: 10),
                _rowContentDetail("Sub Total", "Rp100.000,00"),
                const SizedBox(height: 10),
                _rowContentDetail("Total Discount (50%)", "Rp100.000,00"),
                const SizedBox(height: 10),
                _rowContentDetail("Total PPN (50%)", "Rp100.000,00"),
                const SizedBox(height: 10),
                _rowContentDetail("Total Charge (50%)", "Rp100.000,00"),
                const SizedBox(height: 10),
                _rowContentDetail("Nominal Bayar", "Rp100.000,00"),
                const SizedBox(height: 10),
                _rowContentDetail("Total", "Rp100.000,00"),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _buttonIcon("Tempo", Icon(Icons.timer_outlined)),
              const SizedBox(height: 10),
              _buttonIcon("Batal", Icon(Icons.arrow_back_rounded)),
              const SizedBox(height: 10),
              _buttonIcon("Bayar", Icon(Icons.attach_money_rounded)),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> refreshIndicator() async {
    return;
  }

  Widget _buttonIcon(String text, Icon icon) {
    return SizedBox(
      width: 80,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(0, 0)),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
        ),
        onPressed: () {},
        label: Text(text, style: lv1TextStyle),
        icon: icon,
      ),
    );
  }

  Widget _rowContentDetail(String text, String value) {
    TextStyle textStyle = text == "Total" ? lv2textStyleHarga : lv1TextStyle;
    return Row(
      children: [
        SizedBox(width: 130, child: Text(text, style: textStyle)),
        Text(":", style: textStyle),
        const Spacer(),
        Text(value, style: textStyle),
      ],
    );
  }

  Widget _rowContent(String text, String value) {
    TextStyle textStyle = text == "Total" ? lv2textStyleHarga : lv1TextStyle;
    return Row(
      children: [
        SizedBox(width: 100, child: Text(text, style: textStyle)),
        Text(":", style: textStyle),
        const Spacer(),
        Text(value, style: textStyle),
      ],
    );
  }
}
