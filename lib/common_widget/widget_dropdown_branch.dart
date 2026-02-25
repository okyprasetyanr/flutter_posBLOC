import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:collection/collection.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class WidgetDropdownBranch extends StatelessWidget {
  final String idBranch;
  final Function(String selectedIdBranch) selectedIdBranch;
  WidgetDropdownBranch({
    Key? key,
    required this.idBranch,
    required this.selectedIdBranch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataBranch = context.read<DataUserRepositoryCache>().getBranch();
    return DropdownButtonFormField<ModelBranch>(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPropertyColor.primary, width: 2),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 4),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        label: Text("Pilih Cabang", style: lv1TextStyle),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: lv05TextStyle,
      initialValue: dataBranch.isNotEmpty
          ? dataBranch.firstWhereOrNull(
              (element) => element.getidBranch == idBranch,
            )
          : null,
      items: dataBranch
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
