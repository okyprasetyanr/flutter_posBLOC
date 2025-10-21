import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_state.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_state.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_transaction_sell.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  SellState repo;
  PaymentBloc(this.repo) : super(PaymentInitial()) {
    on<PaymentGetItem>(_oPaymentGetItem);
    on<PaymentAdjust>(_onPaymentAdjust);
  }

  FutureOr<void> _onPaymentAdjust(
    PaymentAdjust event,
    Emitter<PaymentState> emit,
  ) {
    final currentState = state;
    if (currentState is PaymentLoaded) {
      final dataTransaction = currentState.transaction_sell!.copyWith();
      int discount = dataTransaction.getdiscount;
      double charge = dataTransaction.getcharge;
      int ppn = dataTransaction.getdiscount;
      String paymentMethod = dataTransaction.getpaymentMethod;
      double total = dataTransaction.gettotal;

      if (event.charge != null) {}

      if (event.discount != null) {
        discount = event.discount!;
      }

      if (event.ppn != null) {}

      if (event.paymentMethod != null) {}

      emit(
        currentState.copyWith(
          transaction_sell: dataTransaction.copyWith(
            discount: discount,
            ppn: ppn,
            charge: charge,
            paymentMethod: paymentMethod,
            total: total,
          ),
        ),
      );
    }
  }

  Future<void> _oPaymentGetItem(
    PaymentGetItem event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentLoading());
    if (repo is SellLoaded) {
      final repoState = repo as SellLoaded;
      final currentState = state;
      if (currentState is PaymentLoaded) {
        final formattedDate = DateFormat(
          'dd-MM-yyyy, HH:mm:ss',
        ).format(DateTime.now());

        List<ModelItemOrdered> itemOrdered = await List.from(
          repoState.itemOrdered ?? [],
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
        ModelTransactionSell(
          paymentMethod: "Cash",
          date: formattedDate,
          invoice:
              "idOP-${repoState.selectedIDBranch!.substring(0, 4)}-1-${Uuid().v4().substring(0, 4)}",
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
        );
      }
    }
  }
}
