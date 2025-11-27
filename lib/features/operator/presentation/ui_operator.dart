import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/operator/logic/operator_state.dart';
import 'package:flutter_pos/model_data/model_operator.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';

class UIOperator extends StatefulWidget {
  const UIOperator({super.key});

  @override
  State<UIOperator> createState() => _UIOperatorState();
}
  final String idOperator;
  final String nameOperator;
  final String idBranchOperator;
  final int roleOperator;
  final String emailOperator;
  final String phoneOperator;
  final String passwordOperator;
  final String note;
  final String uidOwner;
  final bool statusOperator;
  final DateTime created;

  final PermissionAccess permissionAccess;
class _UIOperatorState extends State<UIOperator> {
final nodes = List.generate(5, (index) => FocusNode());
final nameController = TextEditingController();
final passwordController = TextEditingController();
final phoneController = TextEditingController();
final emailController = TextEditingController();
final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: refreshIndicator,
    );
  }

  Widget layoutTop() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Data Operator", style: titleTextStyle),
            BlocSelector<OperatorBloc, OperatorState, String?>(
              selector: (state) =>
                  state is OperatorLoaded ? state.idBranch : null,
              builder: (context, state) {
                return state == null
                    ? customSpinKit()
                    : WidgetDropdownBranch(
                        idBranch: state,
                        selectedIdBranch: (selectedIdBranch) =>
                            context.read<OperatorBloc>().add(OperatorgetData()),
                      );
              },
            ),
          ],
        ),
        BlocSelector<OperatorBloc, OperatorState, List<ModelOperator>>(
          selector: (state) =>
              state is OperatorLoaded ? state.filteredData : [],
          builder: (context, state) {
            if (state.isEmpty) {
              return Text("Data Operator Kosong!", style: lv05TextStyle);
            }
            return customListGradient(
              data: state,
              getId: (data) => data.getidOperator,
              getName: (data) => data.getnameOperator,
              selectedData: (selectedData) => context.read<OperatorBloc>().add(
                OperatorSelectedData(selectedData: selectedData),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(children: [],);
  }

  Future<void> refreshIndicator() async {}
}
