import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/enum_and_string/enum.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_state.dart';
import 'package:flutter_pos/function/function.dart';

class OperatorFilter extends StatefulWidget {
  final bool isOwner;
  const OperatorFilter({super.key, required this.isOwner});

  @override
  State<OperatorFilter> createState() => _OperatorFilterState();
}

class _OperatorFilterState extends State<OperatorFilter> {
  List<RoleType> roleFilterTypeList = [];
  @override
  void initState() {
    roleFilterTypeList = [
      for (final role
          in widget.isOwner
              ? RoleType.values
              : RoleType.values.where((element) => element.id != 1))
        role,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocSelector<OperatorBloc, OperatorState, RoleType?>(
            selector: (state) {
              if (state is OperatorLoaded) {
                return state.filterRoleUser;
              }
              return null;
            },
            builder: (context, state) {
              return WidgetDropDownFilter(
                initialValue: state != null && roleFilterTypeList.isNotEmpty
                    ? roleFilterTypeList.firstWhere(
                        (element) => element == state,
                      )
                    : null,
                filters: roleFilterTypeList,
                text: "Pilih Operator",
                selectedValue: (indexFilter) {
                  context.read<OperatorBloc>().add(
                    OperatorFilterOperator(roleUser: indexFilter),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: BlocSelector<OperatorBloc, OperatorState, StatusData?>(
            selector: (state) {
              if (state is OperatorLoaded) {
                return state.filterStatusUser;
              }
              return StatusData.Aktif;
            },
            builder: (context, state) {
              return WidgetDropDownFilter(
                initialValue: state,
                filters: statusData,
                text: "Pilih Status",
                selectedValue: (selectedEnum) {
                  context.read<OperatorBloc>().add(
                    OperatorFilterOperator(statusUser: selectedEnum),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
