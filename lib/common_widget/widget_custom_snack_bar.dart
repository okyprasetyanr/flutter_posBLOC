import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void customSnackBar(BuildContext context, String text) {
  showTopSnackBar(
    Overlay.of(context),
    Material(
      color: Colors.transparent,
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppPropertyColor.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: lv05TextStyleWhite,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
