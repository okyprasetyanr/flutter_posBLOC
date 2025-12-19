import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/colors.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

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
      backgroundColor: AppPropertyColor.primary,
    ),
  );
}
