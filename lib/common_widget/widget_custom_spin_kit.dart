import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget customSpinKit({Color? color, double? size}) {
  return SpinKitThreeBounce(
    color: color ?? AppPropertyColor.primary,
    size: size ?? 15.0,
  );
}
