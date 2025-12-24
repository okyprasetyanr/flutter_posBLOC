import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  DataUserRepositoryCache repoCache;
  PaymentBloc(this.repoCache) : super(PaymentInitial()) {
    on<PaymentGetTransaction>(_onGetTransaction);
    on<PaymentAdjust>(_onAdjust, transformer: debounceRestartable());
    on<PaymentProcess>(_onPaymentProcess);
    on<PaymentResetSplit>(_onResetSplit);
    on<PaymentResetTransaction>(_onResetTransaction);
    on<PaymentNote>(_onPaymentNote, transformer: debounceRestartable());
  }

  FutureOr<void> _onResetSplit(
    PaymentResetSplit event,
    Emitter<PaymentState> emit,
  ) {
    final currentState = state;
    if (currentState is PaymentLoaded) {
      final dataTransaction = currentState.transaction_sell!.copyWith(
        charge: 0,
      );
      dataTransaction.getdataSplit.clear();

      emit(currentState.copyWith(transaction_sell: dataTransaction));
      debugPrint("Log PaymentBloc: Split data dihapus");
    }
  }

  FutureOr<void> _onAdjust(PaymentAdjust event, Emitter<PaymentState> emit) {
    final currentState = state;
    if (currentState is PaymentLoaded) {
      final dataTransaction = currentState.transaction_sell!.copyWith();
      int discount = dataTransaction.getdiscount;
      int ppn = dataTransaction.getppn;
      String paymentMethod = dataTransaction.getpaymentMethod;
      int charge =
          paymentMethod == event.paymentMethod || event.paymentMethod == null
          ? dataTransaction.getcharge
          : 0;
      List<ModelSplit>? dataSplit = dataTransaction.getdataSplit;
      String? bankName;
      double billPaid = 0;
      double total = 0;

      debugPrint(
        "Log PaymentBloc: before Ajust: $paymentMethod, $charge, ${event.paymentMethod}",
      );

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

      debugPrint(
        "Log PaymentBloc: Ajust: $paymentMethod, $bankName, $charge, ${event.paymentMethod}",
      );

      final totalOrdered = dataTransaction.getsubTotal;
      final totalDiscount = totalOrdered * (discount / 100);
      final afterDiscount = totalOrdered - totalDiscount;
      final totalPpn = afterDiscount * (ppn / 100);
      final totalCharge = afterDiscount * (charge / 100);
      total = afterDiscount + totalPpn + totalCharge;

      if (paymentMethod == "Debit" || paymentMethod == "QRIS") {
        billPaid = total;
      }

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
            dataSplit: [...dataSplit],
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
      final formattedDate = parseDate(date: DateTime.now());

      List<ModelItemOrdered> itemOrdered = await List.from(
        sellState.itemOrdered ?? const [],
      );
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

      debugPrint("Log PaymentBloc: isSell: ${repoCache.dataAccount!}");
      final counter = repoCache.dataCounter.firstWhere(
        (element) => element.getidBranch == sellState.idBranch,
      );
      final invoice = isNewTransaction || sellState.revision
          ? generateInvoice(
              idOP: repoCache.dataAccount!.getNameUser,
              branchId: sellState.idBranch!,
              queue: sellState.isSell
                  ? counter.getcounterSell + 1
                  : counter.getcounterBuy + 1,
              operatorId: null,
            )
          : dataRevisiOrSaved.getinvoice;

      if (!sellState.isSell) {
        itemOrdered = itemOrdered
            .map(
              (item) => item.copyWith(dateBuy: formattedDate, invoice: invoice),
            )
            .toList();
      } else {
        itemOrdered = itemOrdered
            .map((item) => item.copyWith(invoice: invoice))
            .toList();
      }

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
            date: formattedDate!,
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

      final dataCounter = repoCache.dataCounter;

      final counterIndex = dataCounter.indexWhere(
        (element) => element.getidBranch == transaction.getidBranch,
      );

      dataCounter[counterIndex] = dataCounter[counterIndex].copyWith(
        counterSell: currentState.isSell
            ? dataCounter[counterIndex].getcounterSell + 1
            : null,
        counterBuy: currentState.isSell
            ? null
            : dataCounter[counterIndex].getcounterBuy + 1,
      );

      await FirebaseFirestore.instance
          .collection('counter')
          .doc(UserSession.uid_owner)
          .collection('branch')
          .doc(transaction.getidBranch)
          .update({
            currentState.isSell ? 'counter_sell' : 'counter_buy':
                FieldValue.increment(1),
          });
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
