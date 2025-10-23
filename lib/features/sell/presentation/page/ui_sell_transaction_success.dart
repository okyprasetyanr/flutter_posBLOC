import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_event.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';

class UISellTransactionSuccess extends StatelessWidget {
  const UISellTransactionSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.popUntil(context, ModalRoute.withName('/sell'));
          final bloc = context.read<SellBloc>();
          bloc.add(SellResetOrderedItem());
          bloc.add(SellResetSelectedItem());
        }
      },
      child: LayoutTopBottom(
        layoutTop: layoutTop(),
        layoutBottom: layoutBottom(),
        widgetNavigation: null,
        refreshIndicator: refreshIndicator,
      ),
    );
  }

  Widget layoutTop() {
    return Text("data");
  }

  Widget layoutBottom() {
    return Text("data");
  }

  Future<void> refreshIndicator() async {
    return;
  }
}
