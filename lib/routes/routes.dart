import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_event.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/presentation/page/page_transaction_adjustment.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_event.dart';
import 'package:flutter_pos/features/common_user/batch/presentation/page/page_batch.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_bloc.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_event.dart';
import 'package:flutter_pos/features/common_user/financial/presentation/page/page_financial.dart';
import 'package:flutter_pos/features/common_user/history_adjustment/logic/history_adjustment_bloc.dart';
import 'package:flutter_pos/features/common_user/history_adjustment/logic/history_adjustment_event.dart';
import 'package:flutter_pos/features/common_user/history_adjustment/presentation/page/page_history_adjustment.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_event.dart';
import 'package:flutter_pos/features/common_user/history_financial/presentation/page/page_history_financial.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/common_user/history_transaction/presentation/page/page_history_transaction.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/presentation/page/ui_inventory.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_event.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/common_user/operator/presentation/page/page_operator.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/common_user/partner/presentation/page_partner.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_bloc.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_event.dart';
import 'package:flutter_pos/features/common_user/report/presentation/ui_report.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction_financial.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction_payment.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction_success.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/main.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/screen_signup.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/page/ui_setting_menu.dart';
import 'package:flutter_pos/features/common_user/main_menu/presentation/page/page_main_menu.dart';

final routesPage = {
  '/operator': (context) => BlocProvider(
    create: (context) => OperatorBloc(context.read())..add(OperatorGetData()),
    child: const PageOperator(),
  ),
  '/transfinancial': (context) => BlocProvider(
    create: (context) =>
        TransFinancialBloc(context.read())..add(TransFinancialGetData()),
    child: const UITransactionFinancial(),
  ),
  '/financial': (context) => BlocProvider(
    create: (context) => FinancialBloc(context.read())..add(FinancialGetData()),
    child: const PageFinancial(),
  ),
  '/report': (context) => BlocProvider(
    create: (context) => ReportBloc(context.read())..add(ReportGetData()),
    child: const UIReport(),
  ),
  '/batch': (context) => BlocProvider(
    create: (context) => BatchBloc(context.read())..add(BatchGetData()),
    child: const PageBatch(),
  ),
  '/mainmenu': (context) => BlocProvider(
    create: (context) =>
        DataReportBloc(context.read())..add(DataReportGetData()),
    child: const PageMainMenu(),
  ),
  '/inventory': (context) => BlocProvider(
    create: (context) => InventoryBloc(context.read())..add(InventoryGetData()),
    child: const UIInventory(),
  ),
  '/partner': (context) {
    final isCustomer = ModalRoute.of(context)!.settings.arguments as bool;
    devLog("Log Routes: Partner Arhument: $isCustomer");

    return BlocProvider(
      create: (context) => PartnerBloc(context.read())
        ..add(PartnerGetData())
        ..add(PartnerStatusPartner(isCustomer: isCustomer)),
      child: const PagePartner(),
    );
  },
  '/sell': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;

    final revision = (args?['revision'] as bool?) ?? false;
    final transaction = args?['transaction'] as ModelTransaction?;
    devLog(
      "Log Routes: Transaction Arhument: $transaction, revision=$revision",
    );
    return BlocProvider(
      create: (context) => TransactionBloc(context.read())
        ..add(
          TransactionGetData(
            currentTransaction: transaction,
            revision: revision,
          ),
        ),
      child: const UITransaction(),
    );
  },
  '/historyadjustment': (context) => BlocProvider(
    create: (context) =>
        HistoryAdjustmentBloc()..add(HistoryAdjustmentGetData()),
    child: const PageHistoryAdjustment(),
  ),
  '/historyfinancial': (context) => BlocProvider(
    create: (context) =>
        HistoryFinancialBloc(context.read())..add(HistoryFinancialGetData()),
    child: const UIHistoryFinancial(),
  ),
  '/historytransaction': (context) => BlocProvider(
    create: (context) =>
        HistoryTransactionBloc(context.read())
          ..add(HistoryTransactionGetData()),
    child: const PageHistoryTransaction(),
  ),
  '/selltransactionsuccess': (context) {
    final paymentBloc =
        ModalRoute.of(context)!.settings.arguments as PaymentBloc;

    return BlocProvider.value(
      value: paymentBloc,
      child: const UITransactionSuccess(),
    );
  },
  '/sellpayment': (context) {
    final transactionBloc =
        ModalRoute.of(context)!.settings.arguments as TransactionBloc;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaymentBloc(
            context.read<DataUserRepositoryCache>(),
            transactionBloc,
          )..add(PaymentGetTransaction()),
        ),
        BlocProvider<TransactionBloc>.value(value: transactionBloc),
      ],
      child: Builder(
        builder: (context) {
          return const UITransactionPayment();
        },
      ),
    );
  },
  '/adjustment': (context) => BlocProvider(
    create: (context) =>
        AdjustmentBloc(context.read<DataUserRepositoryCache>())
          ..add(AdjustmentGetData()),
    child: const PageTransactionAdjustment(),
  ),

  '/settings': (context) {
    final mainMenu =
        ModalRoute.of(context)!.settings.arguments as DataReportBloc;
    return BlocProvider.value(value: mainMenu, child: const UISettings());
  },
  '/login': (context) => const ScreenLogin(),
  '/sign-up': (context) => const ScreenSignup(),
};
