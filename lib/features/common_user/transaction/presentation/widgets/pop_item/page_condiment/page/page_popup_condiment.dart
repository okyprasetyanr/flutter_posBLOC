import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/enum_and_string/enum.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/pop_item/page_condiment/popup_condiment_grid_item.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class PopUpPageCondiment extends StatelessWidget {
  const PopUpPageCondiment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Condiment", style: labelTextStyle),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: AppPropertyColor.greyLight,
            ),
            child:
                BlocSelector<
                  TransactionBloc,
                  TransactionState,
                  List<ModelItem>
                >(
                  selector: (state) {
                    if (state is TransactionLoaded) {
                      return state.dataItem
                              ?.where(
                                (element) =>
                                    element.getstatusCondiment ==
                                        StatusData.Aktif &&
                                    element.getidCategoryiItem ==
                                        state.selectedItem?.getidCategoryItem,
                              )
                              .toList() ??
                          [];
                    }
                    return const [];
                  },
                  builder: (context, state) {
                    return PopUpCondimentGridItem(item: state);
                  },
                ),
          ),
        ),
      ],
    );
  }
}
