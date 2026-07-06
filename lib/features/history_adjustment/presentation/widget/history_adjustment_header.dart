import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/date_picker.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_bloc.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_event.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_state.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class HistoryAdjustmentHeader extends StatefulWidget {
  const HistoryAdjustmentHeader({super.key});

  @override
  State<HistoryAdjustmentHeader> createState() =>
      _HistoryAdjustmentHeaderState();
}

class _HistoryAdjustmentHeaderState extends State<HistoryAdjustmentHeader> {
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: customTextField(
                enable: true,
                controller: searchController,
                inputType: TextInputType.text,
                label: "Cari Nama Item/Faktur",
                onChanged: (value) {
                  context.read<HistoryAdjustmentBloc>().add(
                    HistoryAdjustmentSearchData(search: value),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),

            BlocSelector<
              HistoryAdjustmentBloc,
              HistoryAdjustmentState,
              (DateTime?, DateTime?, String)
            >(
              selector: (state) {
                if (state is HistoryAdjustmentLoaded) {
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

                    context.read<HistoryAdjustmentBloc>().add(
                      HistoryAdjustmentGetData(
                        dateStart: pickedDateStart,
                        dateEnd: pickedDateEnd,
                      ),
                    );
                  },
                );
              },
            ),

            customButton(
              backgroundColor: AppPropertyColor.white,
              child: const Icon(
                Icons.refresh_rounded,
                color: AppPropertyColor.black,
              ),
              onPressed: () {
                searchController.clear();
                final bloc = context.read<HistoryAdjustmentBloc>();
                bloc.add(
                  HistoryAdjustmentGetData(
                    dateEnd: dateNowYMDBLOC(),
                    dateStart: dateNowYMDBLOC(),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 150,
          child:
              BlocSelector<
                HistoryAdjustmentBloc,
                HistoryAdjustmentState,
                String
              >(
                selector: (state) => state is HistoryAdjustmentLoaded
                    ? state.idBranch ?? ""
                    : "",
                builder: (context, state) {
                  return WidgetDropdownBranch(
                    idBranch: state,
                    selectedIdBranch: (selectedIdBranch) {
                      searchController.clear();
                      context.read<HistoryAdjustmentBloc>().add(
                        HistoryAdjustmentGetData(idBranch: selectedIdBranch),
                      );
                    },
                  );
                },
              ),
        ),
      ],
    );
  }
}
