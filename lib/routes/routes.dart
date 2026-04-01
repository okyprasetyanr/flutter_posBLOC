import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_event.dart';
import 'package:flutter_pos/features/common_user/batch/presentation/ui_batch.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_bloc.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_event.dart';
import 'package:flutter_pos/features/common_user/financial/presentation/ui_financial.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_event.dart';
import 'package:flutter_pos/features/common_user/history_financial/presentation/ui_history_financial.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/common_user/history_transaction/presentation/ui_history_transaction.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/presentation/page/ui_inventory.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_event.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/common_user/operator/presentation/ui_operator.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/common_user/partner/presentation/ui_partner.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_bloc.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_event.dart';
import 'package:flutter_pos/features/common_user/report/presentation/ui_report.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction_financial.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction_payment.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction_success.dart';
import 'package:flutter_pos/main.dart';
import 'package:flutter_pos/screen_signup.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/page/ui_setting_menu.dart';
import 'package:flutter_pos/features/common_user/main_menu/presentation/ui_main_menu.dart';

final routesPage = {
  '/operator': (context) => BlocProvider(
    create: (context) => OperatorBloc(context.read())..add(OperatorGetData()),
    child: const UIOperator(),
  ),
  '/transfinancial': (context) => BlocProvider(
    create: (context) =>
        TransFinancialBloc(context.read())..add(TransFinancialGetData()),
    child: const UITransactionFinancial(),
  ),
  '/financial': (context) => BlocProvider(
    create: (context) => FinancialBloc(context.read())..add(FinancialGetData()),
    child: const UiFinancial(),
  ),
  '/report': (context) => BlocProvider(
    create: (context) => ReportBloc(context.read())..add(ReportGetData()),
    child: const UIReport(),
  ),
  '/batch': (context) => BlocProvider(
    create: (context) => BatchBloc(context.read())..add(BatchGetData()),
    child: const UiBatch(),
  ),
  '/mainmenu': (context) => BlocProvider(
    create: (context) =>
        DataReportBloc(context.read())..add(DataReportGetData()),
    child: const UIMainMenu(),
  ),
  '/inventory': (context) => BlocProvider(
    create: (context) => InventoryBloc(context.read())..add(InventoryGetData()),
    child: const UIInventory(),
  ),
  '/partner': (context) => BlocProvider(
    create: (context) => PartnerBloc(context.read())..add(PartnerGetData()),
    child: const UIPartner(),
  ),
  '/sell': (context) => BlocProvider(
    create: (context) =>
        TransactionBloc(context.read())..add(TransactionGetData()),
    child: const UITransaction(),
  ),
  '/historyfinancial': (context) => BlocProvider(
    create: (context) =>
        HistoryFinancialBloc(context.read())..add(HistoryFinancialGetData()),
    child: const UiHistoryFinancial(),
  ),
  '/historytransaction': (context) => BlocProvider(
    create: (context) =>
        HistoryTransactionBloc(context.read())
          ..add(HistoryTransactionGetData()),
    child: const UIHistoryTransaction(),
  ),
  '/sellpayment': (context) => BlocProvider.value(
    value: context.read<TransactionBloc>()..add(TransactionGetData()),
    child: const UITransactionPayment(),
  ),
  '/selltransactionsuccess': (context) => BlocProvider.value(
    value: context.read<PaymentBloc>(),
    child: const UITransactionSuccess(),
  ),

  '/settings': (context) => const UISettings(),
  '/login': (context) => const ScreenLogin(),
  '/sign-up': (context) => const ScreenSignup(),
};
