import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/features/hive_setup/model_transaction_save.dart';

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
      LabelPaymentMethod paymentMethod = dataTransaction.getpaymentMethod;
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

      if (paymentMethod == LabelPaymentMethod.Split) {
        final splitPayments = {
          LabelPaymentMethod.Cash: event.billPaidSplitCash,
          LabelPaymentMethod.Debit: event.billPaidSplitDebit,
        };

        for (final entry in splitPayments.entries) {
          final paymentType = entry.key;
          final amount = entry.value;
          if (amount == null) continue;

          int indexdataSplit = dataSplit.indexWhere(
            (e) => e.getpaymentName == paymentType,
          );

          if (indexdataSplit != -1) {
            dataSplit[indexdataSplit] = dataSplit[indexdataSplit].copyWith(
              paymentTotal: amount,
            );
          } else {
            dataSplit.add(
              ModelSplit(paymentName: paymentType, paymentTotal: amount),
            );
          }
        }
        for (final data in dataSplit) {
          billPaid += data.getpaymentTotal;
        }
        if (event.bankName != null) {
          int indexdataSplit = dataSplit.indexWhere(
            (e) => e.getpaymentName == LabelPaymentMethod.Debit,
          );
          if (indexdataSplit != -1) {
            dataSplit[indexdataSplit] = dataSplit[indexdataSplit].copyWith(
              paymentDebitName: event.bankName,
            );
          } else {
            dataSplit.add(
              ModelSplit(
                paymentName: LabelPaymentMethod.Debit,
                paymentTotal: 0,
                paymentDebitName: event.bankName ?? "",
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

      if (paymentMethod == LabelPaymentMethod.Debit ||
          paymentMethod == LabelPaymentMethod.QRIS) {
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
    final sellState =
        event.context.read<TransactionBloc>().state as TransactionLoaded;
    debugPrint(
      "Log PaymentBloc: dataRevisiOrSaved: ${sellState.selectedTransaction}",
    );
    final formattedDate = parseDate(date: DateTime.now());

    List<ModelItemOrdered> itemOrdered = await List.from(sellState.itemOrdered);
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
    final isNewTransaction = dataRevisiOrSaved == null;
    final note = isNewTransaction ? "" : dataRevisiOrSaved.getnote;
    final discount = isNewTransaction ? 0 : dataRevisiOrSaved.getdiscount;
    final ppn = isNewTransaction ? 0 : dataRevisiOrSaved.getppn;

    debugPrint("Log PaymentBloc: isSell: ${repoCache.dataAccount!}");
    final counter = repoCache.dataCounter.firstWhere(
      (element) => element.getidBranch == sellState.idBranch,
    );

    final invoice = generateInvoice(
      idOP: repoCache.dataAccount!.getNameUser,
      branchId: sellState.idBranch,
      queue: sellState.isSell
          ? counter.getcounterSell + 1
          : counter.getcounterBuy + 1,
    );

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
        revisionInvoice: dataRevisiOrSaved?.getinvoice ?? "",
        isSell: sellState.isSell,
        itemOrdered: itemOrdered,
        transaction_sell: ModelTransaction(
          idBranch: sellState.idBranch!,
          itemsOrdered: itemOrdered,
          dataSplit: [],
          billPaid: 0,
          note: note,
          paymentMethod: LabelPaymentMethod.Cash,
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
    final sellState = event.context.read<TransactionBloc>();
    final currentState = state;
    final saved = event.statusTransaction == ListStatusTransaction.Tersimpan;
    if (currentState is PaymentLoaded) {
      final counter = repoCache.dataCounter.firstWhere(
        (element) =>
            element.getidBranch == currentState.transaction_sell!.getidBranch,
      );

      debugPrint(
        "Log PaymentBloc: onPaymentProcess: ${currentState.revisionInvoice}",
      );

      final invoice = saved
          ? (sellState.state as TransactionLoaded).dataTransactionSaved.any(
                  (element) =>
                      element.getinvoice == currentState.revisionInvoice,
                )
                ? currentState.revisionInvoice
                : generateInvoice(
                    idOP: repoCache.dataAccount!.getNameUser,
                    branchId: currentState.transaction_sell?.getidBranch,
                    queue: counter.getcounterSellSaved + 1,
                  )
          : currentState.transaction_sell!.getinvoice;

      final transaction = currentState.transaction_sell!.copyWith(
        statusTransaction: event.statusTransaction,
        invoice: invoice,
      );

      final box = await repoCache.getHiveSavedTransaction();
      debugPrint(
        "Log PaymentBlog: OnPaymentProcess check saved Invoice: $invoice, InvoiceSaved: ${currentState.revisionInvoice}",
      );

      if (saved) {
        final existing = box.get(invoice);
        final cleanedItems = transaction.getitemsOrdered.map((e) {
          return e.copyWith(itemOrderedBatch: []);
        }).toList();

        final newTransaction = transaction.copyWith(
          itemsOrdered: cleanedItems,
          statusTransaction: transaction.getstatusTransaction,
        );
        final newData = convertToMapTransactionSaveHive(newTransaction);

        if (existing != null) {
          await box.put(
            invoice,
            TransactionSavedHive(
              invoice: existing.invoice,
              datatransactionSaved: newData,
              createdAt: existing.createdAt,
            ),
          );
        } else {
          await box.put(
            invoice,
            TransactionSavedHive(
              invoice: invoice!,
              datatransactionSaved: newData,
              createdAt: DateTime.now(),
            ),
          );
        }
      } else {
        final bloc = event.context.read<DataUserRepositoryCache>();
        if (currentState.revisionInvoice != null) {
          if (box.get(currentState.revisionInvoice!) != null) {
            await box.delete(currentState.revisionInvoice);
          }
        }
        await transaction.pushDataTransaction(
          isSell: currentState.isSell,
          dataRepo: bloc,
        );
      }

      final dataCounter = repoCache.dataCounter;

      final counterIndex = dataCounter.indexWhere(
        (element) => element.getidBranch == transaction.getidBranch,
      );

      dataCounter[counterIndex] = dataCounter[counterIndex].copyWith(
        counterSell: saved
            ? null
            : currentState.isSell
            ? dataCounter[counterIndex].getcounterSell + 1
            : null,
        counterBuy: saved
            ? null
            : currentState.isSell
            ? null
            : dataCounter[counterIndex].getcounterBuy + 1,
      );

      debugPrint(
        "Log PaymentProcess: check Counter: dataCounter: $dataCounter, saved: $saved",
      );

      await FirebaseFirestore.instance
          .collection('counter')
          .doc(UserSession.uid_owner)
          .collection('branch')
          .doc(transaction.getidBranch)
          .set({
            currentState.isSell ? 'counter_sell' : 'counter_buy':
                FieldValue.increment(1),
          }, SetOptions(merge: true));
    }

    if (sellState.state is TransactionLoaded) {
      sellState.add(TransactionResetOrderedItem());
      sellState.add(
        TransactionGetData(
          idBranch: (sellState.state as TransactionLoaded).idBranch,
        ),
      );
    }
    repoCache.notifyChanged();
    if (saved) {
      Navigator.pop(event.context);
    }
  }
}
