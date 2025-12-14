import 'package:flutter_pos/features/common_user/batch/presentation/ui_batch.dart';
import 'package:flutter_pos/features/common_user/financial/presentation/ui_financial.dart';
import 'package:flutter_pos/features/common_user/history_financial/presentation/ui_history_financial.dart';
import 'package:flutter_pos/features/common_user/history_transaction/presentation/ui_history_transaction.dart';
import 'package:flutter_pos/features/common_user/inventory/presentation/page/ui_inventory.dart';
import 'package:flutter_pos/features/common_user/operator/presentation/ui_operator.dart';
import 'package:flutter_pos/features/common_user/partner/presentation/ui_partner.dart';
import 'package:flutter_pos/features/common_user/report/presentation/ui_report.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction_financial.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction_payment.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/page/ui_transaction_success.dart';
import 'package:flutter_pos/main.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_print.dart';
import 'package:flutter_pos/screen_main_menu.dart';
import 'package:flutter_pos/screen_signup.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/page/ui_setting_menu.dart';

final routesPage = {
  '/print': (context) => const UIPrint(),
  '/settings': (context) => const UISettings(),
  '/historyfinancial': (context) => const UiHistoryFinancial(),
  '/operator': (context) => const UIOperator(),
  '/transfinancial': (context) => const UITransactionFinancial(),
  '/financial': (context) => const UiFinancial(),
  '/report': (context) => const UIReport(),
  '/historytransaction': (context) => const UIHistoryTransaction(),
  '/sign-up': (context) => const ScreenSignup(),
  '/batch': (context) => const UiBatch(),
  '/partner': (context) => const UIPartner(),
  '/login': (context) => const ScreenLogin(),
  '/mainmenu': (context) => const ScreenMainMenu(),
  '/inventory': (context) => const UIInventory(),
  '/sell': (context) => const UITransaction(),
  '/sellpayment': (context) => const UITransactionPayment(),
  '/selltransactionsuccess': (context) => const UITransactionSuccess(),
};
