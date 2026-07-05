// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_event.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class BatchListItem extends StatelessWidget {
  final List<ModelItem> listItem;
  final TextEditingController searchController;
  const BatchListItem({
    Key? key,
    required this.listItem,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      itemCount: listItem.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 95,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final data = listItem[index];
        return Material(
          color: AppPropertyColor.white,
          borderRadius: BorderRadius.circular(15),
          elevation: 4,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              searchController.clear();
              context.read<BatchBloc>().add(
                BatchSelectedIdItem(selectedIdItem: listItem[index].getidItem),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                children: [
                  Image.asset("assets/logo.png", height: 50),
                  const SizedBox(height: 5),
                  Text(
                    data.getnameItem,
                    style: lv05TextStyle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        formatQtyOrPrice(data.getqtyItem),
                        style: lv0TextStyleRED,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
