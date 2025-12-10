import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

Widget customTextField({
  Widget? prefix,
  List<FocusNode>? nodes,
  String? suffixText,
  int? index,
  String? text,
  TextEditingController? controller,
  bool? enable,
  TextInputType? inputType,
  BuildContext? context,
  FormFieldValidator<String>? validator,
  Function(String value)? onChanged,
}) {
  return TextFormField(
    focusNode: (nodes != null && index != null) ? nodes[index] : null,
    textInputAction: (nodes != null && index != null)
        ? index == nodes.length - 1
              ? TextInputAction.done
              : TextInputAction.next
        : null,
    onFieldSubmitted: (index != null && context != null)
        ? (_) {
            if (index < nodes!.length - 1) {
              FocusScope.of(context).requestFocus(nodes[index + 1]);
            } else {
              FocusScope.of(context).unfocus();
            }
          }
        : null,
    validator: validator,
    keyboardType: inputType ?? TextInputType.text,
    enabled: enable,
    controller: controller,
    style: lv05TextStyle,
    decoration: InputDecoration(
      suffixText: suffixText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: Text(text!, style: lv1TextStyle),
      hint: Text("$text...", style: lv05TextStyle),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      errorStyle: lv05TextStyleRed,
      prefixIcon: prefix,
    ),
    inputFormatters: suffixText != null
        ? [
            FilteringTextInputFormatter.digitsOnly,
            TextInputFormatter.withFunction((oldValue, newValue) {
              if (newValue.text.length > 8) {
                customSnackBar(context!, "Jumlah melebihi batas");
                return oldValue;
              }
              return newValue;
            }),
          ]
        : null,
    onChanged: (value) {
      onChanged != null ? onChanged(value) : null;
    },
  );
}
