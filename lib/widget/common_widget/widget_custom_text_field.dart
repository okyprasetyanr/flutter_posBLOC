import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

Widget customTextField({
  List<FocusNode>? nodes,
  int? index,
  String? text,
  TextEditingController? controller,
  bool? enable,
  TextInputType? inputType,
  BuildContext? context,
  FormFieldValidator<String>? validator,
}) {
  return TextFormField(
    focusNode: (nodes != null && index != null) ? nodes[index] : null,
    textInputAction: index == nodes!.length - 1
        ? TextInputAction.done
        : TextInputAction.next,
    onFieldSubmitted: (index != null && context != null)
        ? (_) {
            if (index < nodes.length - 1) {
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
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: Text(text!, style: lv1TextStyle),
      hint: Text("$text...", style: lv05TextStyle),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      errorStyle: lv05TextStyleRed,
    ),
  );
}
