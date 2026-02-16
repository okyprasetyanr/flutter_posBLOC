import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/payment/top_page/date_invoice_cust_operator.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/payment/top_page/discount.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/payment/top_page/payment_method.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/payment/top_page/ppn.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/payment/top_page/cash_payment.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/payment/top_page/debit_payment.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

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
  final noteController = TextEditingController();

  @override
  void dispose() {
    noteController.dispose();
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
    context.read<PaymentBloc>().add(PaymentGetTransaction(context: context));
  }

  final pageController = PageController();

  void _gotoPage(int page) {
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
          child: ListView(
            children: [
              UIPaymentDateInvoiceCustomerOperator(),
              UIPaymentDiscount(
                customDiscountController: customDiscountController,
              ),
              UIPaymentPPN(customPPNController: customPPNController),
              const SizedBox(height: 10),
              BlocListener<PaymentBloc, PaymentState>(
                listener: (context, state) {
                  if (state is PaymentLoaded) {
                    noteController.text = state.transaction_sell?.getnote ?? "";
                  }
                },
                child: customTextField(
                  controller: noteController,
                  text: "Catatan...",
                  onChanged: (value) =>
                      context.read<PaymentBloc>().add(PaymentNote(note: value)),
                ),
              ),
              const SizedBox(height: 10),
              Text("Tipe Pembayaran", style: lv1TextStyleBold),
              UIPaymentPaymentMethod(
                gotoPage: (value) => _gotoPage(value),
                chargeController: chargeController,
                payController: payController,
                payDebitController: payDebitController,
                selectedAmount: selectedAmount,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                width: 340,
                child: PageView(
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    UIPaymentCashPayment(
                      split: false,
                      payController: payController,
                      selectedAmount: selectedAmount,
                    ),

                    UIPaymentDebitPayment(
                      split: false,
                      chargeController: chargeController,
                      payDebitController: payDebitController,
                    ),

                    Text(
                      "Pastikan Pembayaran sudah diCek kembali!",
                      style: lv05TextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child:
                          BlocSelector<
                            PaymentBloc,
                            PaymentState,
                            List<ModelSplit>
                          >(
                            selector: (state) {
                              if (state is PaymentLoaded) {
                                return state.transaction_sell?.getdataSplit ??
                                    [];
                              }
                              return [];
                            },
                            builder: (context, state) {
                              return Column(
                                children: [
                                  ...state.map((element) {
                                    return rowContent(
                                      "${element.getpaymentName.name}",
                                      formatPriceRp(element.getpaymentTotal),
                                    );
                                  }),
                                ],
                              );
                            },
                          ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
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
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
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
                                "${formatPriceRp(state.getsubTotal)}",
                              ),
                              const SizedBox(height: 10),
                              _rowContentDetail(
                                "Total Discount (${state.getdiscount}%)",
                                "${formatPriceRp(state.gettotalDiscount)}",
                              ),
                              const SizedBox(height: 10),
                              _rowContentDetail(
                                "Total PPN (${state.getppn}%)",
                                "${formatPriceRp(state.gettotalPpn)}",
                              ),
                              const SizedBox(height: 10),
                              _rowContentDetail(
                                "Total Charge (${state.getcharge}%)",
                                "${formatPriceRp(state.gettotalCharge)}",
                              ),
                              const SizedBox(height: 10),
                              _rowContentDetail(
                                "Nominal Bayar",
                                "${formatPriceRp(state.getbillPaid)}",
                              ),
                              const SizedBox(height: 10),
                              _rowContentDetail(
                                "Total",
                                "${formatPriceRp(state.gettotal)}",
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
                    BlocSelector<PaymentBloc, PaymentState, bool>(
                      selector: (state) =>
                          state is PaymentLoaded ? state.isSell : false,
                      builder: (context, isSell) {
                        return isSell
                            ? customButton(
                                backgroundColor: AppPropertyColor.white,
                                child: Text("Simpan", style: lv05TextStyleBold),
                                onPressed: () {
                                  context.read<PaymentBloc>().add(
                                    PaymentProcess(
                                      statusTransaction:
                                          ListStatusTransaction.Tersimpan,
                                      context: context,
                                    ),
                                  );
                                  customSnackBar(
                                    context,
                                    "Transaksi Disimpan!",
                                  );
                                },
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 10),
                    customButtonIcon(
                      backgroundColor: AppPropertyColor.deleteOrClose,
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: AppPropertyColor.white,
                      ),
                      label: Text("Batal", style: lv05TextStyleBoldWhite),
                      onPressed: () {
                        Navigator.popUntil(
                          context,
                          ModalRoute.withName('/sell'),
                        );
                        final blocPayment = context.read<PaymentBloc>();
                        blocPayment.add(PaymentResetTransaction());
                      },
                    ),
                    const SizedBox(height: 10),
                    customButtonIcon(
                      backgroundColor: AppPropertyColor.primary,
                      icon: const Icon(
                        Icons.attach_money_rounded,
                        color: AppPropertyColor.white,
                      ),
                      label: Text("Bayar", style: lv05TextStyleBoldWhite),
                      onPressed: () {
                        final dataTransaction =
                            (context.read<PaymentBloc>().state as PaymentLoaded)
                                .transaction_sell!;
                        if (dataTransaction.getbillPaid == 0 ||
                            dataTransaction.getbillPaid <
                                dataTransaction.gettotal) {
                          return customSnackBar(
                            context,
                            "Nominal Pembayaran tidak Sesuai!",
                          );
                        }

                        if (dataTransaction.getpaymentMethod ==
                                LabelPaymentMethod.Split &&
                            (dataTransaction.getbillPaid == 0 ||
                                dataTransaction.getbillPaid !=
                                    dataTransaction.gettotal)) {
                          return customSnackBar(
                            context,
                            "Nominal Pembayaran tidak Sama!",
                          );
                        }
                        context.read<PaymentBloc>().add(
                          PaymentProcess(
                            statusTransaction: ListStatusTransaction.Sukses,
                            context: context,
                          ),
                        );
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
      ],
    );
  }

  Future<void> refreshIndicator() async {
    return;
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
