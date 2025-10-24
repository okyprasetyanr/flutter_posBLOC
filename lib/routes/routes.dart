import 'package:flutter_pos/features/inventory/presentation/page/ui_inventory.dart';
import 'package:flutter_pos/features/sell/presentation/page/ui_transaction.dart';
import 'package:flutter_pos/features/sell/presentation/page/ui_transaction_payment.dart';
import 'package:flutter_pos/features/sell/presentation/page/ui_transaction_success.dart';
import 'package:flutter_pos/main.dart';
import 'package:flutter_pos/screen_main_menu.dart';

final routesPage = {
  '/login': (context) => const ScreenLogin(),
  '/mainmenu': (context) => const ScreenMainMenu(),
  '/inventory': (context) => const UIInventory(),
  '/sell': (context) => const UITransaction(),
  '/sellpayment': (context) => const UITransactionPayment(),
  '/selltransactionsuccess': (context) => const UITransactionSuccess(),
};
