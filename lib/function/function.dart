import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
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

Future<void> checkAndroidVersion() async {
  final deviceInfo = DeviceInfoPlugin();
  final androidInfo = await deviceInfo.androidInfo;
  final sdkInt = androidInfo.version.sdkInt;

  debugPrint('Android SDK version: $sdkInt');
  debugPrint('Device: ${androidInfo.model}');
  debugPrint('Brand: ${androidInfo.brand}');
}

String generateInvoice({required String idOP, String? branchId, int? queue}) {
  ;
  final branch = branchId!.substring(0, 4);
  final uuid = Uuid().v4().substring(0, 4);
  final operator = idOP.substring(0, 4);
  debugPrint("Log Function: GenerateInvoice: $operator");
  return "$operator-$branch-$queue-$uuid";
}

String formatDate({required DateTime date, bool? minute}) {
  final useMinute = minute ?? true;
  final pattern = useMinute ? 'dd-MM-yyyy HH:mm:ss' : 'dd-MM-yyyy';
  return DateFormat(pattern).format(date);
}

DateTime? parseDate({dynamic date, bool minute = true}) {
  if (date == null) return null;

  if (date is DateTime) return date;

  if (date is String) {
    try {
      final pattern = minute ? 'dd-MM-yyyy HH:mm:ss' : 'dd-MM-yyyy';
      return DateFormat(pattern).parse(date);
    } catch (_) {
      try {
        return DateTime.parse(date);
      } catch (_) {
        return null;
      }
    }
  }

  return null;
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
