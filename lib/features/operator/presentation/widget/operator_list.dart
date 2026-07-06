import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/features/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/operator/logic/operator_state.dart';
import 'package:flutter_pos/features/operator/model/model_user.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class OperatorList extends StatelessWidget {
  const OperatorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OperatorBloc, OperatorState, List<ModelUser>>(
      selector: (state) => state is OperatorLoaded ? state.filteredData : [],
      builder: (context, state) {
        if (state.isEmpty) {
          return Text("Data Operator Kosong!", style: lv05TextStyle);
        }
        return customListGradient(
          data: state,
          getId: (data) => data.getIdUser,
          getName: (data) => data.getNameUser,
          selectedData: (selectedData) => context.read<OperatorBloc>().add(
            OperatorSelectedData(selectedData: selectedData),
          ),
          deleteData: (deleteData) => context.read<OperatorBloc>().add(
            OperatorRemoveData(data: deleteData),
          ),
        );
      },
    );
  }
}
