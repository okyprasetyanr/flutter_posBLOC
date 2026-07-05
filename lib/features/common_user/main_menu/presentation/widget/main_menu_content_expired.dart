// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/model_data/model_expired_item_batch.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class MainMenuContentExpired extends StatelessWidget {
  final List<ModelExpiredItemBatch> expiredItem;
  final ScrollController controller;
  const MainMenuContentExpired({
    Key? key,
    required this.expiredItem,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Item Kadaluarsa", style: lv05TextStyleBold),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: expiredItem.length,
            controller: controller,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset("assets/Logo.png", height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(expiredItem[index].getNameItem),
                      Text("$expiredItem[index].gettotalExpired"),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: expiredItem[index].getInvoiceList.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: AppPropertyColor.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          expiredItem[index].getInvoiceList[index],
                          style: lv05TextStyleItalic,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
