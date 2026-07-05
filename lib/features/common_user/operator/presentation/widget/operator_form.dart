// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_branch.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/enum_and_string/enum.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class OperatorForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController noteController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final List<FocusNode> nodes;
  const OperatorForm({
    Key? key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.noteController,
    required this.passwordController,
    required this.formKey,
    required this.nodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OperatorBloc, OperatorState>(
      listenWhen: (previous, current) {
        if (previous is OperatorLoaded && current is OperatorLoaded) {
          return previous.selectedData != current.selectedData;
        }
        return true;
      },
      listener: (context, state) {
        if (state is OperatorLoaded) {
          if (state.selectedData != null) {
            final selectedData = state.selectedData;
            nameController.text = selectedData?.getNameUser ?? "";
            phoneController.text = selectedData?.getPhoneUser ?? "";
            emailController.text = selectedData?.getEmailUser ?? "";
            noteController.text = selectedData?.getNoteUser ?? "";
          }
        }
      },
      child: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: customTextField(
                    index: 0,
                    nodes: nodes,
                    inputType: TextInputType.text,
                    context: context,
                    label: "Nama Operator",
                    controller: nameController,
                    enable: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: customTextField(
                    context: context,
                    controller: phoneController,
                    enable: true,
                    index: 1,
                    inputType: TextInputType.text,
                    nodes: nodes,
                    label: "Nomor Operator",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            BlocSelector<OperatorBloc, OperatorState, bool>(
              selector: (state) {
                if (state is OperatorLoaded) {
                  return state.isEdit;
                }
                return false;
              },
              builder: (context, state) {
                return customTextField(
                  index: 2,
                  nodes: nodes,
                  inputType: TextInputType.emailAddress,
                  context: context,
                  label: "E-mail Operator",
                  controller: emailController,
                  enable: !state,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "E-mail tidak boleh kosong";
                    }
                    return null;
                  },
                );
              },
            ),

            const SizedBox(height: 5),
            BlocListener<OperatorBloc, OperatorState>(
              listenWhen: (previous, current) =>
                  previous is OperatorLoaded &&
                  current is OperatorLoaded &&
                  previous.isEdit != current.isEdit,
              listener: (context, state) {
                if (state is OperatorLoaded && state.isEdit) {
                  passwordController.clear();
                }
              },
              child: BlocSelector<OperatorBloc, OperatorState, bool>(
                selector: (state) =>
                    state is OperatorLoaded ? state.isEdit : false,
                builder: (context, isEdit) {
                  return isEdit
                      ? BlocSelector<
                          OperatorBloc,
                          OperatorState,
                          ResetPasswordStatus
                        >(
                          selector: (state) => state is OperatorLoaded
                              ? state.resetStatus
                              : ResetPasswordStatus.idle,
                          builder: (context, stateReset) {
                            passwordController.clear();
                            return customButtonIcon(
                              onPressed: () {
                                context.read<OperatorBloc>().add(
                                  OperatorResetPassword(),
                                );
                                switch (stateReset) {
                                  case ResetPasswordStatus.idle:
                                    break;
                                  case ResetPasswordStatus.loading:
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) {
                                        return Center(
                                          child: customSpinKit(
                                            color: AppPropertyColor.white,
                                            size: 30,
                                          ),
                                        );
                                      },
                                    );
                                  case ResetPasswordStatus.success:
                                    {
                                      Navigator.pop(context);
                                      customSnackBar(
                                        context,
                                        "Reset Kata Sandi berhasil dikirim ke E-mail!",
                                      );
                                    }
                                  case ResetPasswordStatus.failure:
                                    {
                                      Navigator.pop(context);
                                      customSnackBar(
                                        context,
                                        "Terjadi kesalahan, silahkan Ulangi!",
                                      );
                                    }
                                }
                              },
                              backgroundColor: AppPropertyColor.primary,
                              icon: const Icon(
                                Icons.lock_reset_rounded,
                                color: AppPropertyColor.white,
                              ),
                              label: Text(
                                "Reset Kata Sandi",
                                style: lv05TextStyleWhite,
                              ),
                            );
                          },
                        )
                      : customTextField(
                          context: context,
                          controller: passwordController,
                          enable: true,
                          index: 3,
                          inputType: TextInputType.text,
                          nodes: nodes,
                          label: "Password Operator",
                        );
                },
              ),
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: customTextField(
                    context: context,
                    controller: noteController,
                    enable: true,
                    index: 4,
                    inputType: TextInputType.text,
                    nodes: nodes,
                    label: "Catatan",
                  ),
                ),

                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: customTextBranch<OperatorBloc, OperatorState>(
                    context,
                    result: (state) {
                      if (state is OperatorLoaded) {
                        return state.dataBranch!
                            .firstWhere(
                              (element) =>
                                  element.getidBranch == state.idBranch,
                            )
                            .getareaBranch;
                      }
                      return "";
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
