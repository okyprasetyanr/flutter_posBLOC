import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_state.dart';
import 'package:flutter_pos/features/sell/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/sell/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentGetItem>(_oPaymentGetItem);
    on<PaymentAdjust>(_onPaymentAdjust);
    on<PaymentResetSplit>(_onPaymentResetSplit);
    on<PaymentResetTransaction>(_onPaymentResetTransaction);
    on<PaymentNote>(
      _onPaymentNote,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
  }

  FutureOr<void> _onPaymentResetSplit(
    PaymentResetSplit event,
    Emitter<PaymentState> emit,
  ) {
    final currentState = state;
    if (currentState is PaymentLoaded) {
      final dataTransaction = currentState.transaction_sell!.copyWith();
      dataTransaction.getdataSplit.clear();

      emit(currentState.copyWith(transaction_sell: dataTransaction));
      debugPrint("Log PaymentBloc: Split data dihapus");
    }
  }

  FutureOr<void> _onPaymentAdjust(
    PaymentAdjust event,
    Emitter<PaymentState> emit,
  ) {
    final currentState = state;
    if (currentState is PaymentLoaded) {
      final dataTransaction = currentState.transaction_sell!.copyWith();
      int discount = dataTransaction.getdiscount;
      int charge = 0;
      int ppn = dataTransaction.getppn;
      String paymentMethod = dataTransaction.getpaymentMethod;
      List<ModelSplit>? dataSplit = dataTransaction.getdataSplit;
      String? bankName;
      double billPaid = 0;
      double total = 0;

      if (event.charge != null) {
        charge = event.charge!;
      }

      if (event.discount != null) {
        discount = event.discount!;
      }

      if (event.ppn != null) {
        ppn = event.ppn!;
      }

      if (event.paymentMethod != null) {
        paymentMethod = event.paymentMethod!;
      }

      if (event.billPaid != null) {
        billPaid = event.billPaid!;
      }

      if (event.bankName != null) {
        bankName = event.bankName;
      }

      if (paymentMethod == "Split") {
        final splitPayments = {
          "Cash": event.billPaidSplitCash,
          "Debit": event.billPaidSplitDebit,
        };

        for (final entry in splitPayments.entries) {
          final name = entry.key;
          final amount = entry.value;
          if (amount == null) continue;

          int indexdataSplit = dataSplit.indexWhere(
            (e) => e.getpaymentName == name,
          );

          if (indexdataSplit != -1) {
            dataSplit[indexdataSplit] = dataSplit[indexdataSplit].copyWith(
              paymentTotal: amount,
            );
          } else {
            dataSplit.add(ModelSplit(paymentName: name, paymentTotal: amount));
          }
        }
        for (final data in dataSplit) {
          billPaid += data.getpaymentTotal;
        }
        if (event.bankName != null) {
          int indexdataSplit = dataSplit.indexWhere(
            (e) => e.getpaymentName == "Debit",
          );
          if (indexdataSplit != -1) {
            dataSplit[indexdataSplit] = dataSplit[indexdataSplit].copyWith(
              paymentDebitName: event.bankName,
            );
          } else {
            dataSplit.add(
              ModelSplit(
                paymentName: "Debit",
                paymentTotal: 0,
                paymentDebitName: event.bankName,
              ),
            );
          }
          bankName = null;
        }
        debugPrint(
          "Log PaymentBloc: Ajust Split: ${event.bankName} ${dataSplit}",
        );
      }

      debugPrint("Log PaymentBloc: Ajust: $paymentMethod, $bankName");

      final totalOrdered = dataTransaction.getsubTotal;
      final totalDiscount = totalOrdered * (discount / 100);
      final totalPpn = totalOrdered * (ppn / 100);
      final totalCharge = totalOrdered * (charge / 100);
      total = totalOrdered - totalDiscount - totalPpn + totalCharge;

      emit(
        currentState.copyWith(
          transaction_sell: dataTransaction.copyWith(
            bankName: bankName,
            billPaid: billPaid,
            discount: discount,
            ppn: ppn,
            charge: charge,
            paymentMethod: paymentMethod,
            total: total,
            totalCharge: totalCharge,
            totalDiscount: totalDiscount,
            totalPpn: totalPpn,
            dataSplit: dataSplit,
          ),
        ),
      );
    }
  }

  Future<void> _oPaymentGetItem(
    PaymentGetItem event,
    Emitter<PaymentState> emit,
  ) async {
    final sellState = event.context.read<TransactionBloc>().state;
    if (sellState is TransactionLoaded) {
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
        priceTotal += Item.getsubTotal;
        final condiment = Item.getCondiment;
        for (
          int indexCondiment = 0;
          indexCondiment < condiment.length;
          indexCondiment++
        ) {
          itemTotal++;
          priceTotal += condiment[indexCondiment].getsubTotal;
        }
      }

      emit(
        PaymentLoaded(
          itemOrdered: itemOrdered,
          transaction_sell: ModelTransaction(
            dataSplit: [],
            billPaid: 0,
            note: "",
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

  FutureOr<void> _onPaymentNote(PaymentNote event, Emitter<PaymentState> emit) {
    final currentState = state;
    if (currentState is PaymentLoaded) {
      debugPrint(
        "Log PaymentBloc: Note ${currentState.transaction_sell!.getnote}",
      );
      emit(
        currentState.copyWith(
          transaction_sell: currentState.transaction_sell!.copyWith(
            note: event.note,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onPaymentResetTransaction(event, Emitter<PaymentState> emit) {
    final currentState = state;
    if (currentState is PaymentLoaded) {
      emit(currentState.copyWith(transaction_sell: null));
    }
  }
}
