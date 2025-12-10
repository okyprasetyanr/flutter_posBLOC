import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

void customSnackBarAccess({required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        context.read<DataUserRepositoryCache>().dataAccount!.getstatusUser
            ? "Akses tidak diijinkan!"
            : "Akun Nonaktif, tidak dapat memilih menu!",
        style: lv05TextStyleWhite,
      ),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColor.primary,
    ),
  );
}
