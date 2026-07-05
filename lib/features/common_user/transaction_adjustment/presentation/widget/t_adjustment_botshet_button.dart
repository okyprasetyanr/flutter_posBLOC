import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_event.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_date.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class TAdjustmentBotshetButton extends StatelessWidget {
  final Color color;
  final ModelDateExpired? dateExpired;
  final GlobalKey<FormState> keyForm;
  final TextEditingController noteController;
  const TAdjustmentBotshetButton({
    super.key,
    required this.color,
    required this.keyForm,
    required this.noteController,
    this.dateExpired,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: customButtonIcon(
        backgroundColor: color,
        label: Text("Simpan", style: lv05TextStyleWhite),
        onPressed: () {
          final isAllEmpty =
              dateExpired?.dayExpired == null &&
              dateExpired?.monthExpired == null &&
              dateExpired?.yearExpired == null;

          final isAllFilled =
              dateExpired?.dayExpired != null &&
              dateExpired?.monthExpired != null &&
              dateExpired?.yearExpired != null;
          final bloc = context.read<AdjustmentBloc>().state as AdjustmentLoaded;

          if (!keyForm.currentState!.validate()) {
            return;
          }

          final dateExp = dateExpired != null
              ? dateExpired!.toDateTime()
              : null;

          devLog(
            "Log UIAdjustment: date: $dateExp, validate: ${bloc.originalItemBatch?.getexpiredDate == dateExp}",
          );

          if (bloc.editedItemBatch == bloc.originalItemBatch &&
              bloc.originalItemBatch?.getexpiredDate == dateExp) {
            return customSnackBar(top: true, context, "Tidak ada yang diubah!");
          }
          if (isAllFilled || isAllEmpty) {
            context.read<AdjustmentBloc>().add(
              AdjustmentUploadData(
                dateExpired: isAllEmpty
                    ? null
                    : "${dateExpired!.dayExpired}-${dateExpired!.monthExpired}-${dateExpired!.yearExpired}",
                note: noteController.text,
              ),
            );
          } else {
            return customSnackBar(
              top: true,
              context,
              "Tanggal Kadaluarsa tidak lengkap!",
            );
          }

          Navigator.pop(context);
        },
        icon: Icon(Icons.check_rounded, color: AppPropertyColor.white),
      ),
    );
  }
}
