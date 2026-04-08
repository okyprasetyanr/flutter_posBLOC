import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget WidgetDropDownFilter<T extends Enum>({
  required T? initialValue,
  required List<T> filters,
  required String text,
  Function(T extension)? extension,
  required Function(T selectedEnum) selectedValue,
}) {
  final fieldKey = GlobalKey<FormFieldState<T>>();
  bool _ignore = false;
  return DropdownButtonFormField<T>(
    key: fieldKey,
    style: lv05TextStyle,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppPropertyColor.primary, width: 2),
      ),
      label: Text(text, style: lv1TextStyle),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
    ),
    initialValue: initialValue,
    validator: (value) {
      if (value == null) {
        return "";
      }
      return null;
    },
    items: filters
        .map(
          (map) => DropdownMenuItem(
            value: map,
            child: Text(
              extension != null ? extension(map).toString() : map.name,
              style: lv05TextStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        )
        .toList(),
    onChanged: (value) {
      if (_ignore) return;

      if (value == null) return;

      final allow = selectedValue(value);

      if (!allow) {
        _ignore = true;
        fieldKey.currentState?.didChange(initialValue);
        _ignore = false;
      }
    },
  );
}
