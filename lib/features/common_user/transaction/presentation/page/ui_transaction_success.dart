import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/row_content.dart';

class UITransactionSuccess extends StatelessWidget {
  const UITransactionSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.popUntil(context, ModalRoute.withName('/sell'));
          context.read<PaymentBloc>().add(PaymentResetTransaction());
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppPropertyColor.white,
        body: SafeArea(
          top: true,
          bottom: true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/success.png", height: 80),
                const SizedBox(height: 10),
                Text("Transaksi Berhasil!", style: lv3TextStyle),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  child: BlocSelector<PaymentBloc, PaymentState, ModelTransaction?>(
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
                          Text("Ringkasan", style: lv1TextStyle),
                          const SizedBox(height: 10),
                          rowContent("Nomor Faktur", state.getinvoice),
                          rowContent(
                            "Tanggal",
                            formatDate(date: state.getdate),
                          ),
                          rowContent("Status", "Sukses"),
                          rowContent(
                            "Catatan",
                            state.getnote.isEmpty ? "-" : state.getnote,
                          ),
                          rowContent("Tipe", state.getpaymentMethod.name),
                          rowContent(
                            "Diskon",
                            "(${state.getdiscount}%) ${formatPriceRp(state.gettotalDiscount)}",
                          ),
                          rowContent(
                            "PPN",
                            "(${state.getppn}%) ${formatPriceRp(state.gettotalPpn)}",
                          ),
                          rowContent(
                            "Charge",
                            "(${state.getcharge}%) ${formatPriceRp(state.gettotalCharge)}",
                          ),
                          rowContent("Total", formatPriceRp(state.getsubTotal)),
                          rowContent("Bayar", formatPriceRp(state.getbillPaid)),
                          rowContent(
                            "kembali",
                            formatPriceRp(
                              state.getbillPaid - state.getsubTotal,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: customButtonIcon(
                                  backgroundColor: AppPropertyColor.primary,
                                  icon: const Icon(
                                    Icons.print_rounded,
                                    color: AppPropertyColor.white,
                                  ),
                                  label: Text(
                                    "Cetak",
                                    style: lv05TextStyleWhite,
                                  ),
                                  onPressed: () =>
                                      context.read<PrinterBloc>().add(
                                        PrintData(
                                          data: state,
                                          type:
                                              PrintFormatType.transaction_sell,
                                        ),
                                      ),
                                ),
                              ),
                              Expanded(
                                child: customButtonIcon(
                                  backgroundColor: AppPropertyColor.condiment,
                                  icon: const Icon(
                                    Icons.send_rounded,
                                    color: AppPropertyColor.white,
                                  ),
                                  label: Text(
                                    "Kirim",
                                    style: lv05TextStyleWhite,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> refreshIndicator() async {
    return;
  }
}
