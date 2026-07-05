import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class MainMenuHeader extends StatelessWidget {
  const MainMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppPropertyColor.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 4),
            color: AppPropertyColor.blackLight,
          ),
        ],
      ),
      child: Center(
        child: BlocSelector<DataReportBloc, DataReportState, String>(
          selector: (state) => state is DataReportLoaded
              ? state.dataAccount!.getNameUser
              : "Mohon Tunggu",
          builder: (context, state) => Text(
            "Halo ${state}, jualan lagi kita!",
            style: lv05TextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
