import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentGetTransaction>(_onGetTransaction);
    on<PaymentAdjust>(_onAdjust);
    on<PaymentProcess>(_onPaymentProcess);
    on<PaymentResetSplit>(_onResetSplit);
    on<PaymentResetTransaction>(_onResetTransaction);
    on<PaymentNote>(
      _onPaymentNote,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
  }

  FutureOr<void> _onResetSplit(
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

  FutureOr<void> _onAdjust(
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

  Future<void> _onGetTransaction(
    PaymentGetTransaction event,
    Emitter<PaymentState> emit,
  ) async {
    final sellState = event.context.read<TransactionBloc>().state;
    if (sellState is TransactionLoaded) {
      debugPrint("Log PaymentBloc: cek SellState");

      debugPrint("Log PaymentBloc: cek Faktur");
      final formattedDate = parseDate(date: formatDate(date: DateTime.now()));

      List<ModelItemOrdered> itemOrdered = await List.from(
        sellState.itemOrdered ?? [],
      );

      for (final dataItemOrdered in itemOrdered) {
        debugPrint("Log PaymentBloc: ItemOrdered: $dataItemOrdered");
      }

      if (!sellState.isSell) {
        itemOrdered = itemOrdered
            .map((item) => item.copyWith(dateBuy: formattedDate))
            .toList();
      }
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

      final ModelTransaction? dataRevisiOrSaved = sellState.selectedTransaction;
      debugPrint(
        "Log PaymentBloc: dataRevisiOrSaved: ${sellState.selectedTransaction}",
      );
      final isNewTransaction = dataRevisiOrSaved == null;

      final note = isNewTransaction ? "" : dataRevisiOrSaved.getnote;
      final discount = isNewTransaction ? 0 : dataRevisiOrSaved.getdiscount;
      final ppn = isNewTransaction ? 0 : dataRevisiOrSaved.getppn;
      final invoice = isNewTransaction || sellState.revision
          ? generateInvoice(
              branchId: sellState.idBranch!,
              queue: 1,
              operatorId: null,
            )
          : dataRevisiOrSaved.getinvoice;
      add(PaymentAdjust(ppn: ppn, discount: discount));
      debugPrint("Log PaymentBloc: isSell: ${sellState.isSell}");
      emit(
        PaymentLoaded(
          isSell: sellState.isSell,
          itemOrdered: itemOrdered,
          transaction_sell: ModelTransaction(
            idBranch: sellState.idBranch!,
            itemsOrdered: itemOrdered,
            dataSplit: [],
            billPaid: 0,
            note: note,
            paymentMethod: "Cash",
            date: formattedDate,
            invoice: invoice,
            namePartner: sellState.selectedPartner?.getname ?? "",
            idPartner: sellState.selectedPartner?.getid ?? "",
            nameOperator: "",
            idOperator: "",
            discount: discount,
            ppn: ppn,
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

  FutureOr<void> _onResetTransaction(
    PaymentResetTransaction event,
    Emitter<PaymentState> emit,
  ) {
    final currentState = state;
    if (currentState is PaymentLoaded) {
      emit(currentState.copyWith(transaction_sell: null));
    }
  }

  Future<void> _onPaymentProcess(
    PaymentProcess event,
    Emitter<PaymentState> emit,
  ) async {
    final currentState = state;
    if (currentState is PaymentLoaded) {
      final transaction = currentState.transaction_sell!.copyWith(
        statusTransaction: statusTransaction(index: event.index),
      );
      final bloc = event.context.read<DataUserRepositoryCache>();
      await transaction.pushDataTransaction(
        isSell: currentState.isSell,
        dataRepo: bloc,
      );
    }



    final sellState = event.context.read<TransactionBloc>();
    if (sellState.state is TransactionLoaded) {
      sellState.add(TransactionResetOrderedItem());
      sellState.add(TransactionResetSelectedItem());
      sellState.add(
        TransactionGetData(
          idBranch: (sellState.state as TransactionLoaded).idBranch,
        ),
      );
    }
  }
}
