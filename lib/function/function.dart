import 'package:flutter/material.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';

String formatUang(double nominal) {
  final nominalfinal = "${formatQty(nominal)}"
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

String formatQty(double qty) {
  final format = NumberFormat("##.##");
  return format.format(qty);
}

Map<String, dynamic> convertToMap(Widget toContext, String text) {
  return {'toContext': toContext, 'text_menu': text};
}

class UserSession {
  static DataUserRepositoryCache? repo;
  static String? uidUser;

  static Future<void> init(DataUserRepositoryCache repo) async {
    final pref = await SharedPreferences.getInstance();
    uidUser = pref.getString("uid_user");
    await repo.initData();
  }

  static String? ambilUidUser() {
    return uidUser;
  }
}



Future<void> checkAndroidVersion() async {
  final deviceInfo = DeviceInfoPlugin();
  final androidInfo = await deviceInfo.androidInfo;
  final sdkInt = androidInfo.version.sdkInt;

  print('Android SDK version: $sdkInt');
  print('Device: ${androidInfo.model}');
  print('Brand: ${androidInfo.brand}');
}
