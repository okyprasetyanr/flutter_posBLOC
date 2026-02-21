import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

final listStatusTransaction = ListStatusTransaction.values
    .map((map) => map)
    .toList();

final filterItem = FilterItem.values.map((map) => map).toList();

final statusData = StatusData.values.map((map) => map).toList();

final filterTypeItem = FilterTypeItem.values.map((map) => map).toList();

String formatPriceRp(double nominal) {
  final nominalfinal = "${formatQtyOrPrice(nominal)}"
      .replaceAll("R", "")
      .replaceAll(".", "")
      .replaceAll(",", "")
      .replaceAll("R", "");
  final format = NumberFormat.currency(
    locale: 'id',
    decimalDigits: 2,
    symbol: 'Rp',
  );
  final convertnominal = double.tryParse(nominalfinal);
  return format.format(convertnominal);
}

String formatQtyOrPrice(double qty) {
  final format = NumberFormat("##.##");
  return format.format(qty);
}

String formatDisc(int disc) {
  return "(-$disc%)";
}

class UserSession {
  static DataUserRepositoryCache? repo;
  static String uid_owner = "";
  static bool fifo = false;

  static Future<void> init(DataUserRepositoryCache? repo) async {
    final pref = await SharedPreferences.getInstance();
    uid_owner = pref.getString("uid_owner")!;
    fifo = pref.getBool("fifo") ?? false;
    if (repo != null) {
      await repo.initData();
    }
  }

  static String getUidOwner() {
    return uid_owner;
  }

  static bool getStatusFifo() {
    return fifo;
  }
}

String generateInvoice({
  required String idOP,
  String? branchId,
  int? queue,
  bool? saved,
}) {
  ;
  final branch = branchId!.substring(0, 4);
  final uuid = saved != null ? "Saved" : Uuid().v4().substring(0, 4);
  final operator = idOP.substring(0, 4);
  debugPrint("Log Function: GenerateInvoice: $operator");
  return "$operator-$branch-$queue-$uuid";
}

String formatDate({required DateTime date, bool? minute}) {
  final useMinute = minute ?? true;
  final pattern = useMinute ? 'dd-MM-yyyy HH:mm:ss' : 'dd-MM-yyyy';
  return DateFormat(pattern).format(date);
}

DateTime parseDate({dynamic date, bool minute = true}) {
  if (date is DateTime) return date;

  final pattern = minute ? 'dd-MM-yyyy HH:mm:ss' : 'dd-MM-yyyy';
  return DateFormat(pattern).parse(date);
}

DateTime dateYMDEndBLOC(DateTime? dateTime) {
  return dateTime != null
      ? DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59, 999)
      : dateNowYMDBLOC(statusEnd: true);
}

DateTime dateYMDStartBLOC(DateTime? dateTime) {
  return dateTime != null
      ? DateTime(dateTime.year, dateTime.month, dateTime.day, 00, 00, 00, 000)
      : dateNowYMDBLOC();
}

DateTime dateNowYMDBLOC({bool? statusEnd}) {
  final end = statusEnd ?? false;
  final now = DateTime.now();
  return end
      ? DateTime(now.year, now.month, now.day, 23, 59, 59, 999)
      : DateTime(now.year, now.month, now.day, 00, 00, 00, 000);
}

Map<String, ({double stock, double ordered})> checkQTY(
  List<ModelItemOrdered> itemOrdered,
  List<ModelItem> listItem,
) {
  Map<String, double> dataItem = {};

  for (final item in itemOrdered) {
    dataItem[item.getidItem] =
        (dataItem[item.getidItem] ?? 0) + item.getqtyItem;
  }

  Map<String, ({double stock, double ordered})> result = {};

  for (final entry in dataItem.entries) {
    final item = listItem.firstWhere(
      (element) => element.getidItem == entry.key,
    );

    result[entry.key] = (stock: item.getqtyItem, ordered: entry.value);
  }

  return result;
}
