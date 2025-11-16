// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class WidgetDropdownBranch extends StatelessWidget {
  final List<ModelBranch> listBranch;
  final String idBranch;
  final Function(String) selectedIdBranch;
  WidgetDropdownBranch({
    Key? key,
    required this.listBranch,
    required this.idBranch,
    required this.selectedIdBranch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ModelBranch>(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 4),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        label: Text("Pilih Cabang", style: lv1TextStyle),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: lv05TextStyle,
      initialValue: listBranch.firstWhere(
        (element) => element.getidBranch == idBranch,
      ),
      items: listBranch
          .map(
            (map) =>
                DropdownMenuItem(value: map, child: Text(map.getareaBranch)),
          )
          .toList(),
      onChanged: (value) {
        selectedIdBranch(value!.getidBranch);
      },
    );
  }
}
