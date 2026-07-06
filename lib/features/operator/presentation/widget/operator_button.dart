import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/features/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/operator/logic/operator_state.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class OperatorButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController noteController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  const OperatorButton({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.noteController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: customButtonIcon(
              backgroundColor: AppPropertyColor.white,
              icon: const Icon(
                Icons.restart_alt_rounded,
                size: lv2IconSize,
                color: AppPropertyColor.black,
              ),
              label: Text("Bersihkan", style: lv05TextStyle),
              onPressed: () {
                nameController.clear();
                phoneController.clear();
                emailController.clear();
                noteController.clear();
                passwordController.clear();
                context.read<OperatorBloc>().add(OperatorResetForm());
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: BlocSelector<OperatorBloc, OperatorState, bool>(
              selector: (state) {
                if (state is OperatorLoaded) {
                  return state.isEdit;
                }
                return false;
              },
              builder: (context, state) {
                return customButtonIcon(
                  icon: const Icon(
                    Icons.check_rounded,
                    color: AppPropertyColor.white,
                  ),
                  backgroundColor: AppPropertyColor.primary,
                  label: Text(
                    state ? "Edit" : "Simpan",
                    style: lv05TextStyleWhite,
                  ),
                  onPressed: () {
                    if (!formKey.currentState!.validate() && !state) {
                      return;
                    } else {
                      context.read<OperatorBloc>().add(
                        OperatorUploadData(
                          context: context,
                          password: passwordController.text,
                          email: emailController.text,
                          name: nameController.text,
                          note: noteController.text,
                          phone: phoneController.text,
                        ),
                      );
                    }
                    ;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
