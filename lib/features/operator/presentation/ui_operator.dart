import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/operator/logic/operator_state.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/custom_dropdown_filter.dart';
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
  final permissionNotifier = ValueNotifier<Map<Permission, bool>>({
    for (final permission in Permission.values) permission: false,
  });

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
    super.initState();
    _initData();
  }

  void _initData() {
    context.read<OperatorBloc>().add(OperatorGetData());
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
        Row(
          children: [
            Expanded(
              child: WidgetDropDownFilter(
                filters: ["All", for (final role in RoleType.values) role.name],
                text: "Pilih Operator",
                selectedValue: (indexFilter) {
                  final index = indexFilter - 1;
                  context.read<OperatorBloc>().add(
                    OperatorFilterOperator(
                      roleUser: index != -1
                          ? RoleType.values[indexFilter - 1]
                          : null,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: WidgetDropDownFilter(
                filters: statusData,
                text: "Pilih Operator",
                selectedValue: (indexFilter) {
                  context.read<OperatorBloc>().add(
                    OperatorFilterOperator(statusUser: indexFilter == 0),
                  );
                },
              ),
            ),
          ],
        ),
        Expanded(
          child: BlocSelector<OperatorBloc, OperatorState, List<ModelUser>>(
            selector: (state) =>
                state is OperatorLoaded ? state.filteredData : [],
            builder: (context, state) {
              if (state.isEmpty) {
                return Text("Data Operator Kosong!", style: lv05TextStyle);
              }
              return customListGradient(
                data: state,
                getId: (data) => data.getIdUser,
                getName: (data) => data.getNameUser,
                selectedData: (selectedData) => context
                    .read<OperatorBloc>()
                    .add(OperatorSelectedData(selectedData: selectedData)),
                deleteData: (deleteData) => context.read<OperatorBloc>().add(
                  OperatorRemoveData(data: deleteData),
                ),
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
                      text: "Nama Operator",
                      controller: nameController,
                      enable: true,
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
                      text: "Nomor Operator",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              customTextField(
                index: 2,
                nodes: nodes,
                inputType: TextInputType.emailAddress,
                context: context,
                text: "Email Operator",
                controller: emailController,
                enable: true,
              ),

              const SizedBox(height: 10),
              customTextField(
                context: context,
                controller: passwordController,
                enable: true,
                index: 3,
                inputType: TextInputType.text,
                nodes: nodes,
                text: "Password Operator",
              ),

              const SizedBox(height: 10),
              Row(
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
                      text: "Catatan",
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

              BlocListener<OperatorBloc, OperatorState>(
                listenWhen: (previous, current) =>
                    previous is OperatorLoaded &&
                    current is OperatorLoaded &&
                    previous.selectedData != current.selectedData,
                listener: (context, state) {
                  final currentState = state;
                  if (currentState is OperatorLoaded) {
                    if (currentState.selectedData == null) {
                      permissionNotifier.value = {
                        for (final permission in Permission.values)
                          permission: false,
                      };
                    } else {
                      final selectedData = currentState.selectedData!;
                      permissionNotifier.value =
                          currentState.selectedData!.getPermissionsUser;
                      nameController.text = selectedData.getNameUser;
                      phoneController.text = selectedData.getPhoneUser;
                      emailController.text = selectedData.getEmailUser;
                      noteController.text = selectedData.getNoteUser ?? "";
                    }
                  }
                },
                child: Row(
                  children: [
                    Expanded(
                      child: WidgetDropDownFilter(
                        filters: [
                          for (final role in RoleType.values.where(
                            (element) => element.name != "Pemilik",
                          ))
                            role.name,
                        ],
                        text: "Pilih Jenis Operator",
                        selectedValue: (indexFilter) {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: customButtonIcon(
                        backgroundColor: AppColor.primary,
                        icon: Icon(
                          Icons.check_box_outlined,
                          color: Colors.white,
                        ),
                        label: Text("Ijin Akses", style: lv05TextStyleWhite),
                        onPressed: () {
                          customBottomSheet(
                            context: context,
                            resetItemForm: () {},
                            content: (scrollController) {
                              return ValueListenableBuilder<
                                Map<Permission, bool>
                              >(
                                valueListenable: permissionNotifier,
                                builder: (context, permissions, _) {
                                  return Column(
                                    children: [
                                      Text("Ijin Akses", style: lv1TextStyle),
                                      Expanded(
                                        child: ListView(
                                          controller: scrollController,
                                          shrinkWrap: true,
                                          children: Permission.values.map((
                                            permission,
                                          ) {
                                            return CheckboxListTile(
                                              dense: true,
                                              activeColor: AppColor.primary,
                                              checkboxScaleFactor: 0.8,
                                              title: Text(
                                                permission.name.replaceAll(
                                                  "_",
                                                  " ",
                                                ),
                                                style: lv05TextStyle,
                                              ),
                                              value:
                                                  permissions[permission] ??
                                                  false,
                                              onChanged: (val) {
                                                permissionNotifier.value = {
                                                  ...permissions,
                                                  permission: val!,
                                                };
                                              },
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
              final data = ModelUser(
                permissionsUser: permissionNotifier.value,
                nameUser: nameController.text,
                idBranchUser:
                    (context.read<OperatorBloc>().state as OperatorLoaded)
                        .idBranch!,
                roleUser: RoleType.Kasir,
                emailUser: emailController.text,
                phoneUser: phoneController.text,
                statusUser: true,
                noteUser: noteController.text,
              );
              context.read<OperatorBloc>().add(
                OperatorUploadData(
                  context: context,
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

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initUser();
    _initData();
  }
}
