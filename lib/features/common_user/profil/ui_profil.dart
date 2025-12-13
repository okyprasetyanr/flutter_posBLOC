import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_custom_text.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class UIProfile extends StatelessWidget {
  const UIProfile({super.key});

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
      child: ListView(
        children: [
          Row(
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
                    Text("Nama", style: lv05TextStyleBold),
                    CustomText(text: dataAccount.getNameUser),
                    const SizedBox(height: 10),
                    Text("E-mail", style: lv05TextStyleBold),
                    CustomText(text: dataAccount.getEmailUser),
                    const SizedBox(height: 10),
                    Text("Nomor Telefon", style: lv05TextStyleBold),
                    CustomText(text: dataAccount.getPhoneUser),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jenis Operator"),
                    CustomText(
                      text: RoleTypeX.fromId(dataAccount.getRoleUser)!.name,
                    ),
                    const SizedBox(height: 10),
                    Text("Perijinan:"),
                    ...Permission.values.map((element) {
                      return rowContent(
                        "${element.name.replaceAll("_", " ")}",
                        dataAccount.getPermissionsUser['${element.name}']
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
      ),
    );
  }
}
