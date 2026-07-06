import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button_reset.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_branch.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/financial/logic/financial_bloc.dart';
import 'package:flutter_pos/features/financial/logic/financial_event.dart';
import 'package:flutter_pos/features/financial/logic/financial_state.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class FinancialForm extends StatefulWidget {
  const FinancialForm({super.key});

  @override
  State<FinancialForm> createState() => _FinancialFormState();
}

class _FinancialFormState extends State<FinancialForm> {
  final nameController = TextEditingController();
  final branchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    branchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: customButtonIconReset(
            onPressed: () {
              context.read<FinancialBloc>().add(
                FinancialResetSelectedFinancial(),
              );
              resetForm();
            },
            color: context.colorFinance,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Form(
                key: _formKey,
                child: BlocListener<FinancialBloc, FinancialState>(
                  listenWhen: (previous, current) =>
                      previous is FinancialLoaded &&
                      current is FinancialLoaded &&
                      previous.selectedFinancial != current.selectedFinancial,
                  listener: (context, state) {
                    if (state is FinancialLoaded) {
                      if (state.selectedFinancial != null) {
                        nameController.text =
                            state.selectedFinancial?.getnameFinancial ?? "";
                      }
                    }
                  },
                  child: customTextField(
                    controller: nameController,
                    enable: true,
                    inputType: TextInputType.text,
                    label: "Nama Kas",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama Kas tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              flex: 2,
              child: customTextBranch<FinancialBloc, FinancialState>(
                context,
                result: (state) {
                  if (state is FinancialLoaded) {
                    return state.dataBranch!
                        .firstWhere(
                          (element) => element.getidBranch == state.idBranch,
                        )
                        .getareaBranch;
                  }
                  return "";
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.center,
                child: Text(AppPropertyText.ManualDelete, style: lv05TextStyle),
              ),
            ),
            Expanded(
              flex: 2,
              child: customButtonIcon(
                backgroundColor: context.colorFinance,
                icon: const Icon(
                  Icons.check_rounded,
                  color: AppPropertyColor.white,
                ),
                label: Text(
                  context.select<FinancialBloc, String>((value) {
                    final state = value.state;
                    bool edit = false;
                    if (state is FinancialLoaded) {
                      edit = state.selectedFinancial != null;
                    }
                    return edit ? "Edit" : "Simpan";
                  }),
                  style: lv05TextStyleWhite,
                ),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  context.read<FinancialBloc>().add(
                    FinancialUploadDataFinancial(name: nameController.text),
                  );
                  resetForm();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void resetForm() {
    _formKey.currentState!.reset();
    nameController.clear();
  }
}
