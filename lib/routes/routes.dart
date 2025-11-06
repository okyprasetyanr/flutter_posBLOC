import 'package:flutter_pos/features/batch/presentation/ui_batch.dart';
import 'package:flutter_pos/features/inventory/presentation/page/ui_inventory.dart';
import 'package:flutter_pos/features/partner/presentation/ui_partner.dart';
import 'package:flutter_pos/features/transaction/presentation/page/ui_transaction.dart';
import 'package:flutter_pos/features/transaction/presentation/page/ui_transaction_payment.dart';
import 'package:flutter_pos/features/transaction/presentation/page/ui_transaction_success.dart';
import 'package:flutter_pos/main.dart';
import 'package:flutter_pos/screen_main_menu.dart';

final routesPage = {
  '/batch': (context) => const UiBatch(),
  '/partner': (context) => const UIPartner(),
  '/login': (context) => const ScreenLogin(),
  '/mainmenu': (context) => const ScreenMainMenu(),
  '/inventory': (context) => const UIInventory(),
  '/sell': (context) => const UITransaction(),
  '/sellpayment': (context) => const UITransactionPayment(),
  '/selltransactionsuccess': (context) => const UITransactionSuccess(),
};
