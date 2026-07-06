import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_bloc.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_event.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_state.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class TAdjustmentHeader extends StatelessWidget {
  final TextEditingController searchItemController;
  final VoidCallback onPress;
  const TAdjustmentHeader({
    super.key,
    required this.searchItemController,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        customButtonIcon(
          backgroundColor: context.colorAdjustment,
          icon: const Icon(
            Icons.menu_rounded,
            color: AppPropertyColor.white,
            size: lv2IconSize,
          ),
          label: Text("Menu", style: lv05TextStyleWhite),
          onPressed: () => onPress(),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: customTextField(
            moreRadius: true,
            controller: searchItemController,
            label: "Cari...",
            onChanged: (value) => context.read<AdjustmentBloc>().add(
              AdjustmentSearchData(text: value),
            ),
          ),
        ),

        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            context.read<AdjustmentBloc>().add(
              AdjustmentGetData(changeMode: true),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 95,
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            height: 40,
            child: BlocSelector<AdjustmentBloc, AdjustmentState, bool>(
              selector: (state) {
                if (state is AdjustmentLoaded) {
                  return state.isAdjustIn;
                }
                return true;
              },
              builder: (context, state) {
                return WidgetAnimatePage(
                  change: state,
                  text1: "Masuk",
                  text2: "Keluar",
                  showAt1: 2,
                  showAt2: 0,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
