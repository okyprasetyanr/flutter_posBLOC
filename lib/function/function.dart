import 'package:flutter/foundation.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

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
  static String? uidUser;
  static bool? fifo;

  static Future<void> init(DataUserRepositoryCache repo) async {
    final pref = await SharedPreferences.getInstance();
    uidUser = pref.getString("uid_user");
    fifo = pref.getBool("fifo");
    await repo.initData();
  }

  static String? getUidUser() {
    return uidUser;
  }

  static bool? getStatusFifo() {
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

String generateInvoice({String? branchId, String? operatorId, int? queue}) {
  final branch = branchId!.substring(0, 4);
  final uuid = Uuid().v4().substring(0, 4);
  final operator = "idOP";
  return "$operator-$branch-$queue-$uuid";
}

const List<String> listStatusTransaction = ["Done", "Pending", "Revisi"];
String statusTransaction({int? index}) {
  return listStatusTransaction[index!];
}
