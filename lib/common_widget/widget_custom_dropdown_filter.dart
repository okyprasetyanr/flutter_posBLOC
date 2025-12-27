import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget WidgetDropDownFilter<T extends Enum>({
  required T? initialValue,
  required List<T> filters,
  required String text,
  required Function(T selectedEnum) selectedValue,
}) {
  return DropdownButtonFormField<T>(
    style: lv05TextStyle,
    decoration: InputDecoration(
      label: Text(text, style: lv1TextStyle),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
    ),
    initialValue: initialValue,
    items: filters
        .map(
          (map) => DropdownMenuItem(
            value: map,
            child: Text(
              map.name,
              style: lv05TextStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        )
        .toList(),
    onChanged: (value) {
      selectedValue(value!);
    },
  );
}
