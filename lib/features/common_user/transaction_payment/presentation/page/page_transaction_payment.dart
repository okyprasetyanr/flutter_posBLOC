import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/logic/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/logic/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/logic/payment_state.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/presentation/widget/t_payment_receipt_header.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/presentation/widget/t_payment_discount.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/presentation/widget/t_payment_method.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/presentation/widget/t_payment_ppn.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/presentation/widget/t_payment_cash.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/presentation/widget/t_payment_debit.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/presentation/widget/t_payment_summary.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/dynamic_layout_top_bottom.dart';
import 'package:flutter_pos/common_widget/row_content.dart';

class PageTransactionPayment extends StatefulWidget {
  const PageTransactionPayment({super.key});

  @override
  State<PageTransactionPayment> createState() => _PageTransactionPaymentState();
}

class _PageTransactionPaymentState extends State<PageTransactionPayment> {
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
      title: "Pembayaran",
      color: context.colorTrans,
    );
  }

  Widget layoutTop() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              TPaymentReceiptHeader(),
              TPaymentDiscount(
                customDiscountController: customDiscountController,
              ),
              TPaymentPPN(customPPNController: customPPNController),
              const SizedBox(height: 10),
              BlocListener<PaymentBloc, PaymentState>(
                listener: (context, state) {
                  if (state is PaymentLoaded) {
                    noteController.text = state.transaction_sell?.getnote ?? "";
                  }
                },
                child: customTextField(
                  controller: noteController,
                  label: "Catatan...",
                  onChanged: (value) =>
                      context.read<PaymentBloc>().add(PaymentNote(note: value)),
                ),
              ),
              const SizedBox(height: 10),
              Text("Tipe Pembayaran", style: lv1TextStyleBold),
              TPaymentMethod(
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
                    TPaymentCash(
                      split: false,
                      payController: payController,
                      selectedAmount: selectedAmount,
                    ),

                    TPaymentDebit(
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
              Expanded(flex: 5, child: TPaymentSummary()),
              const SizedBox(width: 8),
              Expanded(flex: 2, child: TPaymentSummary()),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> refreshIndicator() async {
    return;
  }
}
