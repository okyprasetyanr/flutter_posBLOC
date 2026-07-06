import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_bottom_sheet.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/bottom_page/transaction_list_ordered.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/bottom_page/transaction_content_partner.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/shared/style_and_transition_text/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_snack_bar.dart';

class TransactionBottomPage extends StatelessWidget {
  const TransactionBottomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: TransactionListOrdered()),

        Row(
          children: [
            Expanded(
              flex: 3,
              child: customButtonIcon(
                onPressed: () {
                  customBottomSheet(
                    context: context,
                    resetItemForm: () {},
                    content: (scrollController) {
                      return BlocProvider.value(
                        value: context.read<TransactionBloc>(),
                        child: TransactionContentPartner(
                          scrollController: scrollController,
                        ),
                      );
                    },
                  );
                },
                label: BlocSelector<TransactionBloc, TransactionState, String>(
                  selector: (state) {
                    if (state is TransactionLoaded) {
                      final partner = state.selectedPartner;
                      if (partner?.getidPartner == "") return "Kontak";
                      return partner?.getnamePartner ?? "Kontak";
                    }
                    return "Kontak";
                  },
                  builder: (context, text) {
                    return Text(
                      text,
                      style: lv1TextStyleWhite,
                      overflow: TextOverflow.ellipsis,
                    );
                  },
                ),
                icon: const Icon(
                  Icons.contacts_rounded,
                  color: AppPropertyColor.white,
                ),
                backgroundColor: context.colorTrans,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: customButton(
                backgroundColor: AppPropertyColor.white,
                onPressed: () {
                  context.read<TransactionBloc>().add(
                    TransactionResetOrderedItem(),
                  );
                },
                child: Icon(Icons.delete, color: AppPropertyColor.red),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: customButton(
                onPressed: () {
                  final bloc = context.read<TransactionBloc>();
                  if (bloc.state is TransactionLoaded) {
                    final itemOrdered =
                        (bloc.state as TransactionLoaded).itemOrdered;
                    final listItem =
                        (bloc.state as TransactionLoaded).dataItem!;
                    if (itemOrdered.isEmpty) {
                      return customSnackBar(context, "Belum ada Pesanan!");
                    } else if (UserSession.getStatusFifo() &&
                        (bloc.state as TransactionLoaded).isSell) {
                      final available = checkQTY(itemOrdered, listItem).entries
                          .any((e) {
                            return e.value.ordered > e.value.stock;
                          });
                      if (available) {
                        return customSnackBar(
                          context,
                          "FIFO: Ada Item yang melebihi batas jumlah Stok!",
                        );
                      }
                    }
                  }

                  navUpDownTransition(
                    context,
                    '/sellpayment',
                    false,
                    arguments: context.read<TransactionBloc>(),
                  );
                },
                child: Icon(
                  Icons.attach_money_rounded,
                  color: AppPropertyColor.white,
                ),
                backgroundColor: context.colorTrans,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
