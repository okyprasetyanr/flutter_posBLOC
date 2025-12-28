import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_text.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget customTextBranch<B extends StateStreamable<S>, S>(
  BuildContext context, {
  required Function(S state) result,
}) {
  return Column(
    children: [
      Text("Cabang", style: lv05TextStyle),
      CustomText(
        text: context.select<B, String>((bloc) {
          final state = bloc.state;
          return result(state);
        }),
      ),
    ],
  );
}
