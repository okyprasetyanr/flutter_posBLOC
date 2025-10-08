import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UISellDropDownCabang extends StatelessWidget {
  const UISellDropDownCabang({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SellBloc, SellState, (List<ModelCabang>?, String?)>(
      selector: (state) {
        if (state is SellLoaded) {
          return (state.dataCabang, state.selectedIDCabang);
        }
        return ([], "");
      },
      builder: (context, state) {
        if (state.$1!.isEmpty) {
          return const SpinKitThreeBounce(color: Colors.blue, size: 30.0);
        }

        return DropdownButtonFormField<ModelCabang>(
          padding: EdgeInsets.only(right: 5, left: 5),
          style: lv05TextStyle,
          initialValue: state.$1!.firstWhere(
            (data) => data.getidCabang == state.$2,
          ),
          items: state.$1!
              .map(
                (map) => DropdownMenuItem(
                  value: map,
                  child: Text(map.getdaerahCabang, style: lv05TextStyle),
                ),
              )
              .toList(),
          onChanged: (value) {
            context.read<SellBloc>().add(
              AmbilDataSellBloc(idCabang: value!.getidCabang),
            );
          },
        );
      },
    );
  }
}
