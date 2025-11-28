import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/operator/logic/operator_state.dart';
import 'package:flutter_pos/model_data/model_operator.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';

class UIOperator extends StatefulWidget {
  const UIOperator({super.key});

  @override
  State<UIOperator> createState() => _UIOperatorState();
}

class _UIOperatorState extends State<UIOperator> {
  final nodes = List.generate(5, (index) => FocusNode());
  final searchController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final noteController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    emailController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<OperatorBloc>().add(OperatorGetData());
    super.initState();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Data Operator", style: titleTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: customTextField(
                controller: searchController,
                enable: true,
                inputType: TextInputType.text,
                text: "Cari",
                onChanged: (value) {
                  context.read<OperatorBloc>().add(
                    OperatorSearch(search: value),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: BlocSelector<OperatorBloc, OperatorState, String?>(
                selector: (state) =>
                    state is OperatorLoaded ? state.idBranch : null,
                builder: (context, state) {
                  return state == null
                      ? customSpinKit()
                      : WidgetDropdownBranch(
                          idBranch: state,
                          selectedIdBranch: (selectedIdBranch) => context
                              .read<OperatorBloc>()
                              .add(OperatorGetData()),
                        );
                },
              ),
            ),
          ],
        ),
        Expanded(
          child: BlocSelector<OperatorBloc, OperatorState, List<ModelOperator>>(
            selector: (state) =>
                state is OperatorLoaded ? state.filteredData : [],
            builder: (context, state) {
              if (state.isEmpty) {
                return Text("Data Operator Kosong!", style: lv05TextStyle);
              }
              return customListGradient(
                data: state,
                getId: (data) => data.getidOperator,
                getName: (data) => data.getnameOperator,
                selectedData: (selectedData) => context
                    .read<OperatorBloc>()
                    .add(OperatorSelectedData(selectedData: selectedData)),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: customTextField(
                      index: 0,
                      nodes: nodes,
                      inputType: TextInputType.text,
                      context: context,
                      text: "Nama Operator",
                      controller: nameController,
                      enable: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: BlocSelector<OperatorBloc, OperatorState, String?>(
                      selector: (state) => state is OperatorLoaded
                          ? state.dataBranch
                                ?.firstWhere(
                                  (element) =>
                                      element.getidBranch == state.idBranch,
                                )
                                .getareaBranch
                          : null,
                      builder: (context, state) {
                        return customTextField(
                          index: 1,
                          nodes: nodes,
                          inputType: TextInputType.text,
                          context: context,
                          text: "Cabang",
                          controller: TextEditingController(text: state ?? ""),
                          enable: false,
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              customTextField(
                context: context,
                controller: emailController,
                enable: true,
                index: 1,
                inputType: TextInputType.emailAddress,
                nodes: nodes,
                text: "E-mail Operator",
              ),
              const SizedBox(height: 10),
              customTextField(
                context: context,
                controller: passwordController,
                enable: true,
                index: 2,
                inputType: TextInputType.text,
                nodes: nodes,
                text: "Password Operator",
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: customTextField(
                      context: context,
                      controller: phoneController,
                      enable: true,
                      index: 3,
                      inputType: TextInputType.text,
                      nodes: nodes,
                      text: "Nomor Operator",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: customTextField(
                      context: context,
                      controller: noteController,
                      enable: true,
                      index: 4,
                      inputType: TextInputType.text,
                      nodes: nodes,
                      text: "Catatan",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: Permission.values.length,
                itemBuilder: (context, i) {
                  final permission = Permission.values[i];
                  return CheckboxListTile(
                    title: Text(permission.name),
                    value: null,
                    onChanged: (val) {
                      setState(() {
                        permission.status = !permission.status;
                      });
                    },
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: customButtonIcon(
            icon: Icon(Icons.check_rounded, color: Colors.white),
            backgroundColor: AppColor.primary,
            label: Text("Simpan", style: lv05TextStyleWhite),
            onPressed: () {
              final data = ModelOperator(
                nameOperator: nameController.text,
                idBranchOperator:
                    (context.read<OperatorBloc>().state as OperatorLoaded)
                        .idBranch!,
                roleOperator: 2,
                emailOperator: emailController.text,
                phoneOperator: phoneController.text,
                statusOperator: true,
                created: DateTime.now(),
                note: noteController.text,
              );
              context.read<OperatorBloc>().add(
                OperatorUploadData(
                  data: data,
                  password: passwordController.text,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> refreshIndicator() async {}
}
