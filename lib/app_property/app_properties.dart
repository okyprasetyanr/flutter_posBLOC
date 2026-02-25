import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_bloc.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_state.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_state.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_state.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_bloc.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_state.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_state.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';

class AppPropertyColor {
  static const Color primary = const Color.fromARGB(249, 110, 161, 111);
  static const Color primaryLight1 = const Color.fromARGB(248, 208, 255, 208);
  static const Color primaryLight2 = const Color.fromARGB(248, 173, 255, 173);
  static const Color primaryLight3 = const Color.fromARGB(248, 227, 255, 227);
  static const Color primaryMoreLight = Color.fromARGB(248, 243, 255, 243);
  static const Color red = Color.fromARGB(248, 245, 51, 51);
  static const Color secondPrimary = const Color.fromARGB(255, 255, 154, 72);
  static const Color secondPrimaryLight = Color.fromARGB(255, 255, 223, 196);
  static const Color white = const Color.fromARGB(255, 255, 255, 255);
  static const Color black = const Color.fromARGB(255, 0, 0, 0);
  static const Color blackLight = const Color.fromARGB(66, 0, 0, 0);
  static const Color greyLight = const Color.fromARGB(255, 226, 226, 226);
  static const Color grey = const Color.fromARGB(255, 117, 117, 117);
  static const Color transparent = const Color.fromARGB(0, 0, 0, 0);
  static const Color green = const Color.fromARGB(225, 76, 1775, 80);
}

class AppPropertyText {
  static const String AppName = "Ringkas App";
  static const String ManualDelete =
      "Panduan: Geser ke kiri untuk hapus data yang diinginkan.";
}

extension AppThemeExtension on BuildContext {
  Color getDynamicColor<T extends BlocBase<Object?>>(
    bool Function(Object? state) selector,
  ) {
    final bool condition = select<T, bool>((bloc) => selector(bloc.state));

    return condition
        ? AppPropertyColor.primary
        : AppPropertyColor.secondPrimary;
  }

  Color get colorTrans => getDynamicColor<TransactionBloc>(
    (state) => state is TransactionLoaded && state.isSell,
  );

  Color get colorTransFinance => getDynamicColor<TransFinancialBloc>(
    (state) => state is TransFinancialLoaded ? state.isIncome : true,
  );

  Color get colorFinance => getDynamicColor<FinancialBloc>(
    (state) => state is FinancialLoaded ? state.isIncome : true,
  );

  Color get colorPartner => getDynamicColor<PartnerBloc>(
    (state) => state is PartnerLoaded ? state.isCustomer : true,
  );

  Color get colorHist => getDynamicColor<HistoryTransactionBloc>(
    (state) => state is HistoryTransactionLoaded ? state.isSell : true,
  );
  Color get colorHistFinance => getDynamicColor<HistoryFinancialBloc>(
    (state) => state is HistoryFinancialLoaded ? state.isIncome : true,
  );

  Color get colorReport => getDynamicColor<ReportBloc>(
    (state) => state is ReportLoaded ? state.isSell : true,
  );
}

class AppPropertyBorderRadius {
  static final rounded10 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  static final buttonShape = WidgetStatePropertyAll<OutlinedBorder>(rounded10);
}
