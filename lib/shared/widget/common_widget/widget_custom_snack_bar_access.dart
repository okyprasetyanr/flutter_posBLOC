import 'package:flutter/material.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/helper/enum_and_string/enum.dart';
import 'package:flutter_pos/core/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

Future<void> customSnackBarAccess({required BuildContext context}) async {
  final dataAccount = await getAllAccountIsar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        dataAccount.getstatusUser == StatusData.Aktif
            ? "Akses tidak diijinkan!"
            : "Akun Nonaktif, tidak dapat memilih menu!",
        style: lv05TextStyleWhite,
      ),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppPropertyColor.primary,
    ),
  );
}
