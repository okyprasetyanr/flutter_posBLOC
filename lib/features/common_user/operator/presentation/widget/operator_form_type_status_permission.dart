import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_bottom_sheet.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/enum_and_string/enum.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class OperatorFormTypeStatusPermission extends StatelessWidget {
  const OperatorFormTypeStatusPermission({super.key});

  @override
  Widget build(BuildContext context) {
    final roleTypeList = [
      for (final role in RoleType.values.where(
        (element) => element.id != 1 && element.id != 0,
      ))
        role,
    ];
    return BlocSelector<OperatorBloc, OperatorState, (bool, ModelUser?)>(
      selector: (state) => state is OperatorLoaded
          ? (state.isEdit, state.selectedData)
          : (false, null),
      builder: (context, state) {
        final isowner =
            state.$2 != null &&
            (state.$2?.getRoleUser ?? RoleType.Pemilik) == RoleType.Pemilik;
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: isowner
                    ? () {
                        customSnackBar(
                          context,
                          "Jenis Akun Pemilik tidak dapat Diubah",
                        );
                      }
                    : null,
                child: AbsorbPointer(
                  absorbing: isowner,
                  child: WidgetDropDownFilter(
                    initialValue: state.$1
                        ? state.$2!.getRoleUser
                        : RoleType.Kasir,
                    filters:
                        state.$1 && state.$2!.getRoleUser == RoleType.Pemilik
                        ? roleTypeListOwner(roleTypeList)
                        : roleTypeList,
                    text: "Jenis Operator",
                    selectedValue: (selectedEnum) {
                      context.read<OperatorBloc>().add(
                        OperatorSelectedData(selectedRole: selectedEnum),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: isowner
                    ? () {
                        customSnackBar(
                          context,
                          "Status Akun Pemilik tidak dapat Diubah",
                        );
                      }
                    : null,

                child: AbsorbPointer(
                  absorbing: isowner,
                  child: WidgetDropDownFilter(
                    initialValue: state.$1
                        ? state.$2!.getstatusUser
                        : StatusData.Aktif,
                    filters: statusData,
                    text: "Status",
                    selectedValue: (selectedEnum) {
                      context.read<OperatorBloc>().add(
                        OperatorSelectedData(selectedStatus: selectedEnum),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: customButtonIcon(
                backgroundColor: AppPropertyColor.primary,
                icon: const Icon(
                  Icons.check_box_outlined,
                  color: AppPropertyColor.white,
                ),
                label: Text("Ijin Akses", style: lv05TextStyleWhite),
                onPressed: () {
                  state.$2 != null &&
                          (state.$2?.getRoleUser ?? RoleType.Pemilik) ==
                              RoleType.Pemilik
                      ? customSnackBar(
                          context,
                          "Akun Pemilik memiliki Akses Penuh! Tidak dapat mengubah.",
                        )
                      : customBottomSheet(
                          context: context,
                          resetItemForm: () {},
                          content: (scrollController) => BlocProvider.value(
                            value: context.read<OperatorBloc>(),
                            child:
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
                                              activeColor:
                                                  AppPropertyColor.primary,
                                              checkboxScaleFactor: 0.8,
                                              title: Text(
                                                permission.name.replaceAll(
                                                  "_",
                                                  " ",
                                                ),
                                                style: lv05TextStyle,
                                              ),
                                              value:
                                                  state![permission] ?? false,
                                              onChanged: (val) {
                                                context
                                                    .read<OperatorBloc>()
                                                    .add(
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
                          ),
                        );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  List<RoleType> roleTypeListOwner(List<RoleType> role) {
    List<RoleType> newRoleTypeList = [RoleType.Pemilik, ...role];
    return newRoleTypeList;
  }
}
