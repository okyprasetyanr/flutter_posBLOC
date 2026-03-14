// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/common_widget/widget_custom_text.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UIProfile extends StatelessWidget {
  final ScrollController controller;
  const UIProfile({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FutureBuilder(
        future: getAllAccountIsar(),
        builder: (context, snapshot) =>
            BlocSelector<
              SettingsBloc,
              SettingsState,
              (ModelCompany?, ModelUser?)
            >(
              selector: (state) {
                if (state is SettingsProfileLoaded) {
                  return (state.dataCompany, snapshot.data);
                }
                return (null, null);
              },
              builder: (context, state) {
                return state.$1 == null || state.$2 == null
                    ? customSpinKit()
                    : ListView(
                        controller: controller,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: customTextBorder(
                              "Profil",
                              lv2TextStyleWhite,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Image.asset(
                              "assets/logo.png",
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: FutureBuilder<ModelCompany>(
                                  future: getAllCompanyIsar(),
                                  builder: (context, snapshot) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pengguna",
                                        style: subTitleTextStyle,
                                      ),
                                      Text("Nama", style: lv05TextStyleBold),
                                      CustomText(text: state.$2!.getNameUser),
                                      const SizedBox(height: 10),
                                      Text("E-mail", style: lv05TextStyleBold),
                                      CustomText(text: state.$2!.getEmailUser),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Nomor Telefon",
                                        style: lv05TextStyleBold,
                                      ),
                                      CustomText(text: state.$2!.getPhoneUser),
                                      Text("Cabang", style: lv05TextStyleBold),
                                      CustomText(
                                        text: state.$2!.getIdBranchUser != null
                                            ? snapshot.data!.getListBranch
                                                  .firstWhere((element) {
                                                    if (state
                                                            .$2!
                                                            .getIdBranchUser !=
                                                        null) {
                                                      return element
                                                              .getidBranch ==
                                                          state
                                                              .$2!
                                                              .getIdBranchUser;
                                                    }
                                                    return false;
                                                  })
                                                  .getareaBranch
                                            : "-",
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Tipe Pengguna",
                                        style: lv05TextStyleBold,
                                      ),
                                      CustomText(
                                        text: state.$2!.getRoleUser.name,
                                      ),
                                      const SizedBox(height: 10),
                                      Text("Usaha", style: subTitleTextStyle),
                                      Text("Nama", style: lv05TextStyleBold),
                                      CustomText(
                                        text: snapshot.data!.getnameCompany,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Bergabung:",
                                        style: lv05TextStyleBold,
                                      ),
                                      CustomText(
                                        text: formatDate(
                                          date: snapshot.data!.getcreated,
                                          minute: false,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                        state
                                                .$2!
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
      ),
    );
  }
}
