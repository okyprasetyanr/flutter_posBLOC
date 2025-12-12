import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class UIProfile extends StatelessWidget {
  const UIProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ModelUser dataAccount = context
        .read<DataUserRepositoryCache>()
        .dataAccount!;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Scaffold(
        body: Row(
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: BoxBorder.all(
                        width: 1,
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text(dataAccount.getNameUser, style: lv05TextStyle),
                  ),
                  const SizedBox(height: 10),
                  Text("E-mail", style: lv05TextStyleBold),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: BoxBorder.all(
                        width: 1,
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text(dataAccount.getEmailUser, style: lv05TextStyle),
                  ),
                  const SizedBox(height: 10),
                  Text("Nomor Telefon", style: lv05TextStyleBold),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: BoxBorder.all(
                        width: 1,
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text(dataAccount.getPhoneUser, style: lv05TextStyle),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Jenis Operator"),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: BoxBorder.all(
                        width: 1,
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text(
                      RoleTypeX.fromId(dataAccount.getRoleUser)!.name,
                      style: lv05TextStyle,
                    ),
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
      ),
    );
  }
}
