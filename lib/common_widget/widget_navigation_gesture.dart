import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

class NavigationGesture extends StatefulWidget {
  final List<Map<String, dynamic>> attContent;
  final ValueNotifier<bool> isOpen;
  final VoidCallback close;
  final String currentPage;
  const NavigationGesture({
    super.key,
    required this.attContent,
    required this.isOpen,
    required this.close,
    required this.currentPage,
  });

  @override
  State<NavigationGesture> createState() => _NavigationGestureState();
}

class _NavigationGestureState extends State<NavigationGesture> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.isOpen,
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          left: value ? 0 : -240,
          top: 0,
          bottom: 0,
          child: Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            width: 200,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: customButtonIcon(
                    left: true,
                    icon: Icon(
                      Icons.keyboard_backspace_rounded,
                      color: Colors.white,
                    ),
                    label: Text("Tutup", style: lv1TextStyleWhiteBold),
                    backgroundColor: AppPropertyColor.primary,
                    onPressed: widget.close,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Text("Daftar Menu", style: lv2TextStyle),
                      const SizedBox(height: 10),
                      for (var menu in widget.attContent)
                        _navContent(
                          menu['id'],
                          menu['toContext'],
                          menu['text_menu'],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _navContent(String id, String toRoute, String text) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      color: Colors.white,
      child: Material(
        color: AppPropertyColor.primary,
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            if (widget.currentPage == id) {
              customSnackBar(context, "Anda sudah berada di$text");
            } else {
              Navigator.pop(context);
              navUpDownTransition(context, toRoute, false);
            }
          },
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(text, style: lv1TextStyleWhite),
              ),
              Spacer(),
              if (widget.currentPage == id)
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
