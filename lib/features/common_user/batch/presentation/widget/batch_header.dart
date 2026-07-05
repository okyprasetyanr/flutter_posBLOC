// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_event.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class BatchHeader extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback isOpen;
  const BatchHeader({
    Key? key,
    required this.searchController,
    required this.isOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            customButtonIcon(
              backgroundColor: AppPropertyColor.primary,
              icon: const Icon(
                Icons.menu_rounded,
                color: AppPropertyColor.white,
              ),
              label: Text("Menu", style: lv05TextStyleWhite),
              onPressed: () => isOpen(),
            ),
            Spacer(),
            Text("Stok/Batch", style: titleTextStyle),
            const SizedBox(width: 3),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: customTextField(
                controller: searchController,
                enable: true,
                inputType: TextInputType.text,
                label: "Cari",
                onChanged: (value) {
                  context.read<BatchBloc>().add(BatchSearchItem(search: value));
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: BlocSelector<BatchBloc, BatchState, String>(
                selector: (state) =>
                    state is BatchLoaded ? state.idBranch ?? "" : "",
                builder: (context, state) {
                  return WidgetDropdownBranch(
                    idBranch: state,
                    selectedIdBranch: (selectedIdBranch) {
                      searchController.clear();
                      context.read<BatchBloc>().add(
                        BatchGetData(idBranch: selectedIdBranch),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
