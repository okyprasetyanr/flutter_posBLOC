import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

Widget customTextBranch<B extends StateStreamable<S>, S>(
  BuildContext context, {
  required Function(S state) result,
}) {
  return InputDecorator(
    decoration: InputDecoration(
      isDense: true,
      labelText: "Cabang",
      labelStyle: lv1TextStyle,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      contentPadding: const EdgeInsets.symmetric(vertical: 9, horizontal: 5),
    ),
    child: Text(
      context.select<B, String>((bloc) {
        final state = bloc.state;
        return result(state);
      }),
      style: lv05TextStyle,
    ),
  );
}
