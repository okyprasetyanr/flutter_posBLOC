import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class UISellPayment extends StatefulWidget {
  const UISellPayment({super.key});

  @override
  State<UISellPayment> createState() => _UISellPaymentState();
}

class _UISellPaymentState extends State<UISellPayment> {
  String idcabang = "";
  String idrecipe = "";
  @override
  void initState() {
    super.initState();
    final bloc = context.read<SellBloc>().state;
    if (bloc is SellLoaded) {
      idcabang = bloc.selectedIDBranch!.substring(0, 3);
    }
    idrecipe = Uuid().v4().substring(0, 4);
  }

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
    final now = DateTime.now();
    final formattedDate = DateFormat('dd-MM-yyyy').format(now);
    final formattedTime = DateFormat('HH:mm:ss').format(now);
    return Column(
      children: [
        Text("Pembayaran", style: titleTextStyle),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Tanggal", style: lv05TextStyle),
                  ),
                  Text(":", style: lv05TextStyle),
                  const Spacer(),
                  Text("${formattedDate},", style: lv05TextStyleOrderedItem),
                  const SizedBox(width: 5),
                  Text("${formattedTime}", style: lv05TextStyleOrderedItem),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Nomor Faktur", style: lv05TextStyle),
                  ),
                  Text(":", style: lv05TextStyle),
                  const Spacer(),
                  Text("$idcabang-", style: lv05TextStyleOrderedItem),
                  Text("$idrecipe", style: lv05TextStyleOrderedItem),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Customer", style: lv05TextStyle),
                  ),
                  Text(":", style: lv05TextStyle),
                  const Spacer(),
                  Text("$idcabang-", style: lv05TextStyleOrderedItem),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Operator", style: lv05TextStyle),
                  ),
                  Text(":", style: lv05TextStyle),
                  const Spacer(),
                  Text("$idcabang-", style: lv05TextStyleOrderedItem),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Diskon", style: lv05TextStyle),
                  ),
                  Text(":", style: lv05TextStyle),
                  const Spacer(),
                  Text("$idcabang-", style: lv05TextStyleOrderedItem),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("PPN", style: lv05TextStyle),
                  ),
                  Text(":", style: lv05TextStyle),
                  const Spacer(),
                  Text("$idcabang-", style: lv05TextStyleOrderedItem),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Text("LayoutBottom");
  }

  Future<void> refreshIndicator() async {
    return;
  }
}
