import 'package:flutter_pos/features/inventory/presentation/page/ui_inventory.dart';
import 'package:flutter_pos/features/sell/presentation/page/ui_sell.dart';
import 'package:flutter_pos/features/sell/presentation/page/ui_sell_payment.dart';
import 'package:flutter_pos/features/sell/presentation/page/ui_sell_transaction_success.dart';
import 'package:flutter_pos/main.dart';
import 'package:flutter_pos/screen_main_menu.dart';

final routesPage = {
  '/login': (context) => const ScreenLogin(),
  '/mainmenu': (context) => const ScreenMainMenu(),
  '/inventory': (context) => const UIInventory(),
  '/sell': (context) => const UiSell(),
  '/sellpayment': (context) => const UISellPayment(),
  '/selltransactionsuccess': (context) => const UISellTransactionSuccess(),
};
