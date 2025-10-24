import 'package:flutter/material.dart';
import 'package:flutter_pos/colors/colors.dart';

class UITransactionSavedCart extends StatelessWidget {
  const UITransactionSavedCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
            ),
            minimumSize: WidgetStatePropertyAll(Size(0, 0)),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
            backgroundColor: WidgetStatePropertyAll(AppColor.primary),
          ),
          onPressed: () {},
          child: Icon(
            Icons.shopping_bag_rounded,
            size: 20,
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 10,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(
              "0",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
