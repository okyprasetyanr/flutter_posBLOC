import 'package:flutter/material.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget customSpinKit({Color? color, double? size}) {
  return SpinKitThreeBounce(
    color: color ?? AppColor.primary,
    size: size ?? 15.0,
  );
}
