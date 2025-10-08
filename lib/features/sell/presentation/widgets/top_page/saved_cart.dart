import 'package:flutter/material.dart';
import 'package:flutter_pos/colors/colors.dart';

class UISellSavedCart extends StatelessWidget {
  const UISellSavedCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            backgroundColor: WidgetStatePropertyAll(AppColor.primary),
          ),
          onPressed: () {},
          child: Icon(
            Icons.shopping_bag_rounded,
            size: 24,
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 14,
          top: 4,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(
              "0",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
