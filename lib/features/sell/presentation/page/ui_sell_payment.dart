import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_state.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/payment/top_page/date_invoice_cust_operator.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/payment/top_page/discount.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/payment/top_page/payment_method.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/payment/top_page/ppn.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/payment/top_page/quick_pay_widget.dart';
import 'package:flutter_pos/function/function.dart';
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
  final customPPNController = TextEditingController();
  final chargController = TextEditingController();

  @override
  void dispose() {
    customDiscountController.dispose();
    customPPNController.dispose();
    chargController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<PaymentBloc>().add(PaymentGetItem(context: context));
  }

  final listBank = [
    "BCA",
    "BRI",
    "Mandiri",
    "BNI",
    "BTN",
    "CIMB Niaga",
    "Permata",
    "Danamon",
    "BTPN / Jenius",
    "BNC (Neo Commerce)",
    "SeaBank",
    "Bank Jago",
    "BSI (Syariah Indonesia)",
  ];

  final pageController = PageController();

  void _gotoPage(int page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageController.hasClients) {
        pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    UIPaymentDateInvoiceCustomerOperator(),
                    UIPaymentDiscount(
                      customDiscountController: customDiscountController,
                    ),
                    UIPaymentPPN(customPPNController: customPPNController),
                    const SizedBox(height: 10),
                    TextField(
                      style: lv05TextStyle,
                      decoration: InputDecoration(
                        labelText: "Catatan",
                        labelStyle: lv05TextStyle,
                        hintText: "Catatan...",
                        hintStyle: lv05TextStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onChanged: (value) => context.read<PaymentBloc>().add(
                        PaymentNote(note: value),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("Tipe Pembayaran", style: lv1TextStyleBold),
                    UIPaymentPaymentMethod(
                      gotoPage: (value) => _gotoPage(value),
                    ),
                    SizedBox(
                      height: 100,
                      width: 300,
                      child: PageView(
                        controller: pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          QuicPayWidgetAndCustomPay(),

                          Padding(
                            padding: EdgeInsetsGeometry.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      label: Text(
                                        "Daftar Bank",
                                        style: lv05TextStyle,
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                                    items: listBank
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
                                      context.read<PaymentBloc>().add(
                                        PaymentAdjust(paymentMethod: value),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: chargController,
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    style: lv05TextStyle,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      suffixText: "%",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      labelText: "PPN",
                                      labelStyle: lv05TextStyle,
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      TextInputFormatter.withFunction((
                                        oldValue,
                                        newValue,
                                      ) {
                                        final customPpn = newValue.text;
                                        final intValue =
                                            int.tryParse(
                                              customPpn.isEmpty
                                                  ? "0"
                                                  : customPpn,
                                            ) ??
                                            0;
                                        if (intValue > 100) {
                                          customSnackBar(
                                            context,
                                            "Jumlah melebihi 100%",
                                          );
                                          return oldValue;
                                        }
                                        context.read<PaymentBloc>().add(
                                          PaymentAdjust(charge: intValue),
                                        );
                                        return newValue;
                                      }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text("QRIS"),
                          Text("Split"),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(
      children: [
        Text("Detail Transaksi", style: titleTextStyle),
        Expanded(
          child: SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child:
                        BlocSelector<
                          PaymentBloc,
                          PaymentState,
                          ModelTransactionSell?
                        >(
                          selector: (state) {
                            if (state is PaymentLoaded) {
                              return state.transaction_sell!;
                            }
                            return null;
                          },
                          builder: (context, state) {
                            if (state == null) {
                              return SizedBox.shrink();
                            }
                            return Column(
                              children: [
                                _rowContentDetail(
                                  "Total Item",
                                  "${state.gettotalItem}",
                                ),
                                const SizedBox(height: 10),
                                _rowContentDetail(
                                  "Sub Total",
                                  "${formatUang(state.getsubTotal)}",
                                ),
                                const SizedBox(height: 10),
                                _rowContentDetail(
                                  "Total Discount (${state.getdiscount}%)",
                                  "${formatUang(state.gettotalDiscount)}",
                                ),
                                const SizedBox(height: 10),
                                _rowContentDetail(
                                  "Total PPN (${state.getppn}%)",
                                  "${formatUang(state.gettotalPpn)}",
                                ),
                                const SizedBox(height: 10),
                                _rowContentDetail(
                                  "Total Charge (${state.getcharge}%)",
                                  "${formatUang(state.gettotalCharge)}",
                                ),
                                const SizedBox(height: 10),
                                _rowContentDetail(
                                  "Nominal Bayar",
                                  "${formatUang(state.getbillPaid)}",
                                ),
                                const SizedBox(height: 10),
                                _rowContentDetail(
                                  "Total",
                                  "${formatUang(state.gettotal)}",
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buttonIcon(
                        "Tempo",
                        Icon(Icons.timer_outlined, color: Colors.black),
                        lv05TextStyle,
                        Colors.white,
                      ),
                      const SizedBox(height: 10),
                      _buttonIcon(
                        "Batal",
                        Icon(Icons.arrow_back_rounded, color: Colors.white),
                        lv05TextStyleWhite,
                        Colors.red,
                      ),
                      const SizedBox(height: 10),
                      _buttonIcon(
                        "Bayar",
                        Icon(Icons.attach_money_rounded, color: Colors.white),
                        lv05TextStyleWhite,
                        AppColor.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> refreshIndicator() async {
    return;
  }

  Widget _buttonIcon(
    String text,
    Icon icon,
    TextStyle textStyle,
    Color backgroundColor,
  ) {
    return SizedBox(
      width: 80,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
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
        label: Text(text, style: textStyle),
        icon: icon,
      ),
    );
  }

  Widget _rowContentDetail(String text, String value) {
    TextStyle textStyle = text == "Total"
        ? lv1TextStylePrimaryPrice
        : lv05TextStyle;
    return Row(
      children: [
        SizedBox(width: 110, child: Text(text, style: textStyle)),
        Text(":", style: textStyle),
        const Spacer(),
        Text(value, style: textStyle),
      ],
    );
  }
}
