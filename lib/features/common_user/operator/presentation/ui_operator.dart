import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_state.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';

class UIOperator extends StatefulWidget {
  const UIOperator({super.key});

  @override
  State<UIOperator> createState() => _UIOperatorState();
}

class _UIOperatorState extends State<UIOperator> {
  final nodes = List.generate(5, (index) => FocusNode());
  final _formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final noteController = TextEditingController();
  final branchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    emailController.dispose();
    noteController.dispose();
    branchController.dispose();
    super.dispose();
  }

  List<String> roleFilterTypeList = [];
  List<String> roleTypeList = [];

  bool isOwner = false;
  @override
  void initState() {
    super.initState();
    _initData();
    isOwner =
        context.read<DataUserRepositoryCache>().dataAccount!.getIdUser ==
        UserSession.uid_owner;
    roleFilterTypeList = [
      "All",
      for (final role
          in isOwner
              ? RoleType.values
              : RoleType.values.where((element) => element.id != 1))
        role.name,
    ];
    roleTypeList = [
      for (final role in RoleType.values.where((element) => element.id != 1))
        role.name,
    ];
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
                          selectedIdBranch: (selectedIdBranch) {
                            context.read<OperatorBloc>().add(
                              OperatorGetData(idBranch: selectedIdBranch),
                            );
                            searchController.clear();
                          },
                        );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: WidgetDropDownFilter(
                filters: roleFilterTypeList,
                text: "Pilih Operator",
                selectedValue: (indexFilter) {
                  context.read<OperatorBloc>().add(
                    OperatorFilterOperator(
                      roleUser: RoleTypeX.fromString(
                        roleFilterTypeList[indexFilter],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: WidgetDropDownFilter(
                filters: statusData,
                text: "Pilih Status",
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
          child: BlocListener<OperatorBloc, OperatorState>(
            listenWhen: (previous, current) =>
                previous is OperatorLoaded &&
                current is OperatorLoaded &&
                (previous.selectedData != current.selectedData ||
                    previous.idBranch != current.idBranch),
            listener: (context, state) {
              final currentState = state;
              if (currentState is OperatorLoaded) {
                if (currentState.selectedData == null) {
                  nameController.clear();
                  phoneController.clear();
                  emailController.clear();
                  noteController.clear();
                  passwordController.clear();
                } else {
                  final selectedData = currentState.selectedData;
                  nameController.text = selectedData?.getNameUser ?? "";
                  phoneController.text = selectedData?.getPhoneUser ?? "";
                  emailController.text = selectedData?.getEmailUser ?? "";
                  noteController.text = selectedData?.getNoteUser ?? "";
                }
                branchController.text = currentState.idBranch!;
                debugPrint("Log UIOperator: IDBranch: masuk");
              }
            },
            child: Form(
              key: _formKey,
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
                          text: "Nomor Operator",
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
                        text: "E-mail Operator",
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
                  const SizedBox(height: 10),
                  // BlocSelector<OperatorBloc, OperatorState, bool>(
                  //   selector: (state) =>
                  //       state is OperatorLoaded ? state.isEdit : false,
                  //   builder: (context, state) => state
                  //       ? SizedBox.shrink()
                  //       :
                  customTextField(
                    context: context,
                    controller: passwordController,
                    enable: true,
                    index: 3,
                    inputType: TextInputType.text,
                    nodes: nodes,
                    text: "Password Operator",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong";
                      }
                      return null;
                    },
                  ),

                  // ),
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
                        child: customTextField(
                          inputType: TextInputType.text,
                          context: context,
                          text: "Cabang",
                          controller: branchController,
                          enable: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        BlocSelector<OperatorBloc, OperatorState, (bool, ModelUser?)>(
          selector: (state) => state is OperatorLoaded
              ? (state.isEdit, state.selectedData)
              : (false, null),
          builder: (context, state) => Row(
            children: [
              Expanded(
                child: WidgetDropDownFilter(
                  initialValue: state.$1
                      ? roleTypeList.firstWhere(
                          (element) =>
                              element ==
                              RoleTypeX.fromId(state.$2!.getRoleUser)!.name,
                        )
                      : null,
                  filters: roleTypeList,
                  text: "Jenis Operator",
                  selectedValue: (index) {
                    context.read<OperatorBloc>().add(
                      OperatorSelectedData(
                        selectedRole: RoleTypeX.fromString(
                          roleTypeList[index],
                        )!.id,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: WidgetDropDownFilter(
                  initialValue: state.$1
                      ? statusData.firstWhere(
                          (element) =>
                              element ==
                              statusData[state.$2!.getstatusUser ? 0 : 1],
                        )
                      : null,
                  filters: statusData,
                  text: "Status",
                  selectedValue: (indexFilter) {
                    context.read<OperatorBloc>().add(
                      OperatorSelectedData(selectedStatus: indexFilter == 0),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: customButtonIcon(
                  backgroundColor: AppPropertyColor.primary,
                  icon: Icon(Icons.check_box_outlined, color: Colors.white),
                  label: Text("Ijin Akses", style: lv05TextStyleWhite),
                  onPressed: () {
                    customBottomSheet(
                      context: context,
                      resetItemForm: () {},
                      content: (scrollController) =>
                          BlocSelector<
                            OperatorBloc,
                            OperatorState,
                            Map<Permission, bool>?
                          >(
                            selector: (state) => state is OperatorLoaded
                                ? state.selectedPermission
                                : null,
                            builder: (context, state) => Column(
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
                                        activeColor: AppPropertyColor.primary,
                                        checkboxScaleFactor: 0.8,
                                        title: Text(
                                          permission.name.replaceAll("_", " "),
                                          style: lv05TextStyle,
                                        ),
                                        value: state![permission] ?? false,
                                        onChanged: (val) {
                                          context.read<OperatorBloc>().add(
                                            OperatorSelectedData(
                                              selectedPermission: {
                                                ...state,
                                                permission: val!,
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: BlocSelector<OperatorBloc, OperatorState, bool>(
            selector: (state) {
              if (state is OperatorLoaded) {
                return state.isEdit;
              }
              return false;
            },
            builder: (context, state) {
              return customButtonIcon(
                icon: Icon(Icons.check_rounded, color: Colors.white),
                backgroundColor: AppPropertyColor.primary,
                label: Text(
                  state ? "Edit" : "Simpan",
                  style: lv05TextStyleWhite,
                ),
                onPressed: () {
                  if (!_formKey.currentState!.validate() && !state) {
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
    );
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initUser();
    _initData();
  }
}
