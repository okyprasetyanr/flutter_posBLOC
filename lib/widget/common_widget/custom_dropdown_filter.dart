import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

Widget WidgetDropDownFilter<T>({
  required List<String> filters,
  required String text,
  required Function(int indexFilter) selectedValue,
}) {
  return DropdownButtonFormField<String>(
    style: lv05TextStyle,
    decoration: InputDecoration(
      label: Text(text, style: lv1TextStyle),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
    ),
    initialValue: filters.first,
    items: filters
        .map(
          (map) => DropdownMenuItem(
            value: map,
            child: Text(
              map,
              style: lv05TextStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        )
        .toList(),
    onChanged: (value) {
      selectedValue(filters.indexOf(value!));
    },
  );
}
