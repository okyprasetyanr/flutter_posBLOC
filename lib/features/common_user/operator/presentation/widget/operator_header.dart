import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_state.dart';

class OperatorHeader extends StatefulWidget {
  const OperatorHeader({super.key});

  @override
  State<OperatorHeader> createState() => _OperatorHeaderState();
}

class _OperatorHeaderState extends State<OperatorHeader> {
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: customTextField(
            controller: searchController,
            enable: true,
            inputType: TextInputType.text,
            label: "Cari",
            onChanged: (value) {
              context.read<OperatorBloc>().add(OperatorSearch(search: value));
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: BlocSelector<OperatorBloc, OperatorState, String?>(
            selector: (state) =>
                state is OperatorLoaded ? state.idBranch : null,
            builder: (context, state) {
              return state == null
                  ? customSpinKit()
                  : WidgetDropdownBranch(
                      idBranch: state,
                      selectedIdBranch: (selectedIdBranch) {
                        context.read<OperatorBloc>().add(
                          OperatorGetData(idBranch: selectedIdBranch),
                        );
                        searchController.clear();
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
