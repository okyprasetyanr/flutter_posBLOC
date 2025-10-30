import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/sell/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/sell/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UITransactionDropDownCabang extends StatelessWidget {
  const UITransactionDropDownCabang({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      TransactionBloc,
      TransactionState,
      (List<ModelCabang>?, String?)
    >(
      selector: (state) {
        if (state is TransactionLoaded) {
          return (state.dataBranch, state.selectedIDBranch);
        }
        return ([], "");
      },
      builder: (context, state) {
        if (state.$1!.isEmpty) {
          return const SpinKitThreeBounce(color: Colors.blue, size: 30.0);
        }

        return DropdownButtonFormField<ModelCabang>(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 4),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            label: Text("Pilih Cabang", style: lv1TextStyle),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          style: lv05TextStyle,
          initialValue: state.$1!.firstWhere(
            (data) => data.getidBranch == state.$2,
          ),
          items: state.$1!
              .map(
                (map) => DropdownMenuItem(
                  value: map,
                  child: Text(
                    map.getareaBranch,
                    style: lv05TextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            context.read<TransactionBloc>().add(
              TransactionAmbilDataSellBloc(idCabang: value!.getidBranch),
            );
          },
        );
      },
    );
  }
}
