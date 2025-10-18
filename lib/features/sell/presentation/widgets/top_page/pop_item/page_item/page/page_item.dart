import 'package:flutter/material.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/pop_item/page_item/discount_and_custom_discount.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/pop_item/page_item/name_and_qty.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/pop_item/page_item/note_and_subtotal.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/pop_item/page_item/price_and_custom_price.dart';

class SellPopUpPageItem extends StatelessWidget {
  const SellPopUpPageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SellPopUpNameAndQty(),
          const SizedBox(height: 10),
          SellPopUpNoteAndSubTotal(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: SellPopUpPriceAndCustomPrice()),
              const SizedBox(width: 10),
              Expanded(flex: 4, child: SellPopUpDiscountAndCustomDiscount()),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
