import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_reset.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_branch.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class PartnerForm extends StatefulWidget {
  const PartnerForm({super.key});

  @override
  State<PartnerForm> createState() => _PartnerFormState();
}

class _PartnerFormState extends State<PartnerForm> {
  final namePartnerController = TextEditingController();
  final phonePartnerController = TextEditingController();
  final emailPartnerController = TextEditingController();
  final branchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<FocusNode> nodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    namePartnerController.dispose();
    emailPartnerController.dispose();
    phonePartnerController.dispose();
    branchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Form Data:", style: lv1TextStyleBold),
            Align(
              alignment: Alignment.centerRight,
              child: customButtonIconReset(
                onPressed: () {
                  context.read<PartnerBloc>().add(
                    PartnerResetSelectedPartner(),
                  );
                  resetForm();
                },
                color: context.colorPartner,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        BlocListener<PartnerBloc, PartnerState>(
          listenWhen: (previous, current) =>
              previous is PartnerLoaded &&
              current is PartnerLoaded &&
              previous.selectedPartner != current.selectedPartner,
          listener: (context, state) {
            if (state is PartnerLoaded) {
              if (state.selectedPartner != null) {
                namePartnerController.text =
                    state.selectedPartner!.getnamePartner;
                phonePartnerController.text =
                    state.selectedPartner!.getphonePartner;
                emailPartnerController.text =
                    state.selectedPartner?.getemailPartner ?? "";
              }
            }
          },
          child: BlocSelector<PartnerBloc, PartnerState, bool>(
            selector: (state) {
              if (state is PartnerLoaded) {
                return state.isCustomer;
              }
              return true;
            },
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Form(
                          key: _formKey,
                          child: customTextField(
                            index: 0,
                            nodes: nodes,
                            inputType: TextInputType.text,
                            context: context,
                            label: "Nama Kontak",
                            controller: namePartnerController,
                            enable: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Nama tidak Boleh Kosong";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      Expanded(
                        child: customTextField(
                          index: 1,
                          nodes: nodes,
                          context: context,
                          label: "Nomor Kontak",
                          controller: phonePartnerController,
                          enable: true,
                          inputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: customTextField(
                          index: 2,
                          nodes: nodes,
                          context: context,
                          label: "E-mail",
                          controller: emailPartnerController,
                          enable: true,
                          inputType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: customTextBranch<PartnerBloc, PartnerState>(
                          context,
                          result: (state) {
                            if (state is PartnerLoaded) {
                              return state.dataBranch
                                      ?.firstWhere(
                                        (element) =>
                                            element.getidBranch ==
                                            state.idBranch,
                                      )
                                      .getareaBranch ??
                                  "";
                            }
                            return "";
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
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
                onPressed: () {
                  devLog(
                    "UIPartner: date: ${parseDate(date: formatDate(date: DateTime.now()))},",
                  );
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  context.read<PartnerBloc>().add(
                    PartnerUploadDataPartner(
                      email: emailPartnerController.text,
                      name: namePartnerController.text,
                      phone: phonePartnerController.text,
                    ),
                  );

                  resetForm();
                },
                icon: const Icon(
                  Icons.check_rounded,
                  color: AppPropertyColor.white,
                ),
                label: Text(
                  context.select<PartnerBloc, String>((value) {
                    final bloc = value.state;
                    if (bloc is PartnerLoaded) {
                      return bloc.selectedPartner != null ? "Edit" : "Simpan";
                    }
                    return "Simpan";
                  }),
                  style: lv05TextStyleWhite,
                ),
                backgroundColor: context.colorPartner,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void resetForm() {
    _formKey.currentState!.reset();
    namePartnerController.clear();
    emailPartnerController.clear();
    phonePartnerController.clear();
  }
}
