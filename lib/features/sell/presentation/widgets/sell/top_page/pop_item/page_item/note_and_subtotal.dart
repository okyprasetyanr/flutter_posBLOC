import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class SellPopUpNoteAndSubTotal extends StatefulWidget {
  const SellPopUpNoteAndSubTotal({super.key});

  @override
  State<SellPopUpNoteAndSubTotal> createState() =>
      _SellPopUpNoteAndSubTotalState();
}

class _SellPopUpNoteAndSubTotalState extends State<SellPopUpNoteAndSubTotal> {
  TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BlocListener<SellBloc, SellState>(
            listenWhen: (previous, current) =>
                previous is SellLoaded &&
                current is SellLoaded &&
                previous.selectedItem?.getNote != current.selectedItem?.getNote,
            listener: (context, state) {
              if (state is SellLoaded) {
                if (state.selectedItem == null) {
                  noteController.clear();
                } else {
                  noteController.text = state.selectedItem!.getNote;
                }
              }
            },
            child: TextField(
              style: lv05TextStyle,
              decoration: InputDecoration(
                labelText: "Catatan",
                labelStyle: lv05TextStyle,
                hintText: "Catatan...",
                hintStyle: lv05TextStyle,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              controller: noteController,
              onChanged: (value) =>
                  context.read<SellBloc>().add(SellAdjustItem(note: value)),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: TextField(
            style: lv05TextStyleDisable,
            enabled: false,
            controller: TextEditingController(
              text:
                  "${formatUang(context.select<SellBloc, double?>((value) {
                    final state = value.state;
                    if (state is SellLoaded && state.selectedItem != null) {
                      return state.selectedItem!.getsubTotal;
                    }
                    return 0;
                  })!)}",
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              label: Text(
                "Sub Total:",
                style: lv05TextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ),
      ],
    );
  }
}
