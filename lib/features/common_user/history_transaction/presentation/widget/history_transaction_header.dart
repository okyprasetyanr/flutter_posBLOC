import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/date_picker.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class HistoryTransactionHeader extends StatelessWidget {
  final TextEditingController searchController;
  const HistoryTransactionHeader({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: customTextField(
            context: context,
            controller: searchController,
            enable: true,
            inputType: TextInputType.text,
            label: "Cari",
            onChanged: (value) {
              context.read<HistoryTransactionBloc>().add(
                HistoryTransactionSearchData(search: value),
              );
            },
          ),
        ),
        const SizedBox(width: 10),

        BlocSelector<
          HistoryTransactionBloc,
          HistoryTransactionState,
          (DateTime?, DateTime?, String)
        >(
          selector: (state) {
            if (state is HistoryTransactionLoaded) {
              return (state.dateStart, state.dateEnd, state.displayDate);
            }
            return (dateNowYMDBLOC(), dateNowYMDBLOC(), "Hari ini");
          },
          builder: (context, state) {
            return customButton(
              backgroundColor: AppPropertyColor.white,
              child: Text(state.$3, style: lv05TextStyle),
              onPressed: () async {
                DateTime? pickedDateStart, pickedDateEnd;
                await customDatePicker(
                  false,
                  "Tanggal mulai",
                  context,
                  parseDate(date: DateTime.now(), minute: false),
                  (picked) => pickedDateStart = picked,
                );

                await customDatePicker(
                  true,
                  "Tanggal selesai",
                  context,
                  parseDate(date: DateTime.now(), minute: false),
                  (picked) => pickedDateEnd = picked,
                );

                context.read<HistoryTransactionBloc>().add(
                  HistoryTransactionGetData(
                    dateStart: pickedDateStart,
                    dateEnd: pickedDateEnd,
                    idBranch: null,
                  ),
                );
              },
            );
          },
        ),

        const SizedBox(width: 10),
        customButton(
          child: const Icon(
            Icons.refresh_rounded,
            color: AppPropertyColor.black,
          ),
          backgroundColor: AppPropertyColor.white,
          onPressed: () {
            context.read<HistoryTransactionBloc>().add(
              HistoryTransactionGetData(),
            );
            searchController.clear();
          },
        ),
      ],
    );
  }
}
