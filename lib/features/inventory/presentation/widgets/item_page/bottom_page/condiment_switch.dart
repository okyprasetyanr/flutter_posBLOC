import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class CondimentSwitch extends StatelessWidget {
  const CondimentSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<InventoryBloc, InventoryState, bool>(
      selector: (state) {
        if (state is InventoryLoaded) {
          return state.condimentForm;
        }
        return false;
      },
      builder: (contextBloc, state) {
        return GestureDetector(
          onTap: () => context.read<InventoryBloc>().add(
            InvCondimentForm(condimentForm: !state),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 135,
            padding: EdgeInsets.only(top: 5, bottom: 5),
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: state ? AppColor.primary : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: (state ? Colors.black : Colors.green).withValues(
                    alpha: 0.4,
                  ),
                  blurStyle: BlurStyle.outer,
                  blurRadius: 15,
                ),
              ],
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  left: state ? -50 : 5,
                  duration: Duration(milliseconds: 500),
                  child: Icon(Icons.check_circle_outline_rounded, size: 25),
                ),
                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  left: state ? 100 : 150,
                  duration: Duration(milliseconds: 500),
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  top: 2,
                  left: state ? -100 : 38,
                  duration: Duration(milliseconds: 500),
                  child: Text("Normal", style: lv1TextStyle),
                ),
                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  left: state ? 10 : 150,
                  top: 2,
                  duration: Duration(milliseconds: 500),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Condiment", style: lv1TextStyleWhite),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
