import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_state.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_transaction_sell.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentGetItem>(_oPaymentGetItem);
    on<PaymentAdjust>(_onPaymentAdjust);
    on<PaymentNote>(
      _onPaymentNote,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
  }

  FutureOr<void> _onPaymentAdjust(
    PaymentAdjust event,
    Emitter<PaymentState> emit,
  ) {
    final currentState = state;
    if (currentState is PaymentLoaded) {
      final dataTransaction = currentState.transaction_sell!.copyWith();
      int discount = dataTransaction.getdiscount;
      int charge = dataTransaction.getcharge;
      int ppn = dataTransaction.getppn;
      String paymentMethod = dataTransaction.getpaymentMethod;
      double total = 0;

      if (event.charge != null) {}

      if (event.discount != null) {
        discount = event.discount!;
      }

      if (event.ppn != null) {
        ppn = event.ppn!;
      }

      if (event.paymentMethod != null) {
        paymentMethod = event.paymentMethod!;
      }

      final totalOrdered = dataTransaction.getsubTotal;
      final totalDiscount = totalOrdered * (discount / 100);
      final totalPpn = totalOrdered * (ppn / 100);
      final totalCharge = totalOrdered * (charge / 100);
      total = totalOrdered - totalDiscount - totalPpn - totalCharge;
      emit(
        currentState.copyWith(
          transaction_sell: dataTransaction.copyWith(
            discount: discount,
            ppn: ppn,
            charge: charge,
            paymentMethod: paymentMethod,
            total: total,
            totalCharge: totalCharge,
            totalDiscount: totalDiscount,
            totalPpn: totalPpn,
          ),
        ),
      );
    }
  }

  Future<void> _oPaymentGetItem(
    PaymentGetItem event,
    Emitter<PaymentState> emit,
  ) async {
    final sellState = event.context.read<SellBloc>().state;
    if (sellState is SellLoaded) {
      debugPrint("Log PaymentBloc: cek SellState");

      debugPrint("Log PaymentBloc: cek Faktur");
      final formattedDate = DateFormat(
        'dd-MM-yyyy, HH:mm:ss',
      ).format(DateTime.now());

      List<ModelItemOrdered> itemOrdered = await List.from(
        sellState.itemOrdered ?? [],
      );
      int itemTotal = 0;
      double priceTotal = 0;
      for (int indexItem = 0; indexItem < itemOrdered.length; indexItem++) {
        final Item = itemOrdered[indexItem];
        itemTotal++;
        priceTotal += Item.getpriceItemCustom;
        final condiment = Item.getCondiment;
        for (
          int indexCondiment = 0;
          indexCondiment < condiment.length;
          indexCondiment++
        ) {
          itemTotal++;
          priceTotal += condiment[indexCondiment].getpriceItemCustom;
        }
      }

      emit(
        PaymentLoaded(
          itemOrdered: itemOrdered,
          transaction_sell: ModelTransactionSell(
            paymentMethod: "Cash",
            date: formattedDate,
            invoice:
                "idOP-${sellState.selectedIDBranch!.substring(0, 4)}-1-${Uuid().v4().substring(0, 4)}",
            nameCustomer: "",
            idCustomer: "",
            nameOperator: "",
            idOperator: "",
            discount: 0,
            ppn: 0,
            totalItem: itemTotal,
            subTotal: priceTotal,
            charge: 0,
            total: priceTotal,
            totalCharge: 0,
            totalDiscount: 0,
            totalPpn: 0,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onPaymentNote(
    PaymentNote event,
    Emitter<PaymentState> emit,
  ) {}
}
