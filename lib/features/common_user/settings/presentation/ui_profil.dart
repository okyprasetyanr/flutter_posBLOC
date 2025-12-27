// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/common_widget/widget_custom_text.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UIProfile extends StatelessWidget {
  final ScrollController controller;
  const UIProfile({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModelUser dataAccount = context
        .read<DataUserRepositoryCache>()
        .dataAccount!;
    ModelCompany dataCompany = context
        .read<DataUserRepositoryCache>()
        .dataCompany!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: BlocSelector<SettingsBloc, SettingsState, (ModelCompany?, ModelUser?)>(
        selector: (state) {
          if (state is SettingsProfileLoaded) {
            return (state.dataCompany, dataAccount);
          }
          return (null, null);
        },
        builder: (context, state) {
          return state.$1 == null || state.$2 == null
              ? customSpinKit()
              : ListView(
                  controller: controller,
                  children: [
                    Center(child: Text("Profil", style: titleTextStyle)),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  "assets/logo.png",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              const SizedBox(height: 10),

                              Text("Pengguna", style: subTitleTextStyle),
                              Text("Nama", style: lv05TextStyleBold),
                              CustomText(text: dataAccount.getNameUser),
                              const SizedBox(height: 10),
                              Text("E-mail", style: lv05TextStyleBold),
                              CustomText(text: dataAccount.getEmailUser),
                              const SizedBox(height: 10),
                              Text("Nomor Telefon", style: lv05TextStyleBold),
                              CustomText(text: dataAccount.getPhoneUser),
                              Text("Cabang", style: lv05TextStyleBold),
                              CustomText(
                                text: dataAccount.getIdBranchUser != null
                                    ? dataCompany.getListBranch.firstWhere((
                                        element,
                                      ) {
                                        if (dataAccount.getIdBranchUser !=
                                            null) {
                                          return element.getidBranch ==
                                              dataAccount.getIdBranchUser;
                                        }
                                        return false;
                                      }).getareaBranch
                                    : "-",
                              ),
                              const SizedBox(height: 10),
                              Text("Tipe Pengguna", style: lv05TextStyleBold),
                              CustomText(text: dataAccount.getRoleUser.name),
                              const SizedBox(height: 10),
                              Text("Usaha", style: subTitleTextStyle),
                              Text("Nama", style: lv05TextStyleBold),
                              CustomText(text: dataCompany.getnameCompany),
                              const SizedBox(height: 10),
                              Text("Bergabung:", style: lv05TextStyleBold),
                              CustomText(
                                text: formatDate(
                                  date: dataCompany.getcreated,
                                  minute: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Perijinan Pengguna",
                                style: subTitleTextStyle,
                              ),
                              const SizedBox(height: 10),
                              ...Permission.values.map((element) {
                                return rowContent(
                                  "${element.name.replaceAll("_", " ")}",
                                  dataAccount
                                          .getPermissionsUser['${element.name}']
                                          ?.toString() ??
                                      "Terbuka",
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
