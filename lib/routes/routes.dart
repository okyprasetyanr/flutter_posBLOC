import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/common_user/batch/presentation/ui_batch.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_bloc.dart';
import 'package:flutter_pos/features/common_user/financial/presentation/ui_financial.dart';
import 'package:flutter_pos/features/common_user/history_financial/presentation/ui_history_financial.dart';
import 'package:flutter_pos/features/common_user/history_transaction/presentation/ui_history_transaction.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/presentation/page/ui_inventory.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/presentation/ui_operator.dart';
import 'package:flutter_pos/features/common_user/partner/presentation/ui_partner.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_bloc.dart';
import 'package:flutter_pos/features/common_user/report/presentation/ui_report.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_bloc.dart';
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
    create: (context) => OperatorBloc(context.read()),
    child: UIOperator(),
  ),
  '/transfinancial': (context) => BlocProvider(
    create: (context) => TransFinancialBloc(context.read()),
    child: UITransactionFinancial(),
  ),
  '/financial': (context) => BlocProvider(
    create: (context) => FinancialBloc(context.read()),
    child: UiFinancial(),
  ),
  '/report': (context) => BlocProvider(
    create: (context) => ReportBloc(context.read()),
    child: UIReport(),
  ),
  '/batch': (context) => BlocProvider(
    create: (context) => BatchBloc(context.read()),
    child: UiBatch(),
  ),
  '/mainmenu': (context) => BlocProvider(
    create: (context) => DataReportBloc(context.read()),
    child: UIMainMenu(),
  ),
  '/inventory': (context) => BlocProvider(
    create: (context) => InventoryBloc(context.read()),
    child: UIInventory(),
  ),
  '/partner': (context) => const UIPartner(),
  '/sell': (context) => const UITransaction(),
  '/sellpayment': (context) => const UITransactionPayment(),
  '/settings': (context) => const UISettings(),
  '/historyfinancial': (context) => const UiHistoryFinancial(),
  '/historytransaction': (context) => const UIHistoryTransaction(),

  '/selltransactionsuccess': (context) => const UITransactionSuccess(),
  '/login': (context) => const ScreenLogin(),
  '/sign-up': (context) => const ScreenSignup(),
};
