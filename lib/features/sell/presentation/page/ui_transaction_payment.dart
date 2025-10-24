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
import 'package:flutter_pos/features/sell/presentation/widgets/payment/top_page/cash_payment.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/payment/top_page/debit_payment.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UITransactionPayment extends StatefulWidget {
  const UITransactionPayment({super.key});

  @override
  State<UITransactionPayment> createState() => _UITransactionPaymentState();
}

class _UITransactionPaymentState extends State<UITransactionPayment> {
  final payController = TextEditingController();
  final selectedAmount = ValueNotifier<double>(0);
  final customDiscountController = TextEditingController();
  final customPPNController = TextEditingController();
  final chargeController = TextEditingController();
  final payDebitController = TextEditingController();

  @override
  void dispose() {
    payDebitController.dispose();
    customDiscountController.dispose();
    customPPNController.dispose();
    chargeController.dispose();
    payController.dispose();
    selectedAmount.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<PaymentBloc>().add(PaymentGetItem(context: context));
  }

  final pageController = PageController();

  void _gotoPage(int page) {
    context.read<PaymentBloc>().add(PaymentResetSplit());
    chargeController.clear();
    payController.clear();
    payDebitController.clear();

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
          child: BlocSelector<PaymentBloc, PaymentState, ModelTransaction?>(
            selector: (state) {
              if (state is PaymentLoaded) {
                return state.transaction_sell;
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
                      height: 150,
                      width: 340,
                      child: PageView(
                        controller: pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: UIPaymentCashPayment(
                              split: false,
                              payController: payController,
                              selectedAmount: selectedAmount,
                            ),
                          ),
                          UIPaymentDebitPayment(
                            split: false,
                            chargeController: chargeController,
                            payDebitController: payDebitController,
                          ),
                          Text("QRIS"),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: AppColor.primarymorelight,
                                    borderRadius: BorderRadius.circular(8),
                                    border: BoxBorder.all(
                                      width: 1,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text("Cash", style: lv05TextStyleBold),
                                      UIPaymentCashPayment(
                                        split: true,
                                        payController: payController,
                                        selectedAmount: selectedAmount,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.primarymorelight,
                                    borderRadius: BorderRadius.circular(8),
                                    border: BoxBorder.all(
                                      width: 1,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text("Debit", style: lv05TextStyleBold),
                                      UIPaymentDebitPayment(
                                        split: true,
                                        chargeController: chargeController,
                                        payDebitController: payDebitController,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
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
                          ModelTransaction?
                        >(
                          selector: (state) {
                            if (state is PaymentLoaded) {
                              return state.transaction_sell;
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
                        () {},
                      ),
                      const SizedBox(height: 10),
                      _buttonIcon(
                        "Batal",
                        Icon(Icons.arrow_back_rounded, color: Colors.white),
                        lv05TextStyleWhite,
                        Colors.red,
                        () {
                          Navigator.popUntil(
                            context,
                            ModalRoute.withName('/sell'),
                          );
                          final blocPayment = context.read<PaymentBloc>();
                          blocPayment.add(PaymentResetTransaction());
                        },
                      ),
                      const SizedBox(height: 10),
                      _buttonIcon(
                        "Bayar",
                        Icon(Icons.attach_money_rounded, color: Colors.white),
                        lv05TextStyleWhite,
                        AppColor.primary,
                        () {
                          final billPaid =
                              (context.read<PaymentBloc>().state
                                      as PaymentLoaded)
                                  .transaction_sell!;
                          if (billPaid.getbillPaid == 0 ||
                              billPaid.getbillPaid < billPaid.gettotal) {
                            return customSnackBar(
                              context,
                              "Nominal Pembayaran tidak Sesuai!",
                            );
                          }
                          navUpDownTransition(
                            context,
                            '/selltransactionsuccess',
                            false,
                          );
                        },
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
    Function() function,
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
        onPressed: function,
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
