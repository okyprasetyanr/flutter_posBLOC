import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';

class LayoutTopBottom extends StatelessWidget {
  final Widget layoutTop;
  final Widget layoutBottom;
  final Widget? widgetNavigation;
  final RefreshCallback refreshIndicator;

  const LayoutTopBottom({
    super.key,
    required this.layoutTop,
    required this.layoutBottom,
    required this.widgetNavigation,
    required this.refreshIndicator,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: AppPropertyColor.white,
        body: SafeArea(
          top: true,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: RefreshIndicator(
              onRefresh: refreshIndicator,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height:
                      mediaQuery.size.height -
                      mediaQuery.padding.top -
                      mediaQuery.padding.bottom,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final height = constraints.maxHeight;
                      final width = constraints.maxWidth;
                      return OrientationBuilder(
                        builder: (context, orientation) {
                          if (orientation == Orientation.portrait) {
                            return Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: height * 0.6,
                                    width: width,
                                    child: layoutTop,
                                  ),
                                ),
                                Positioned(
                                  top: height * 0.615,
                                  bottom: 0,
                                  child: SizedBox(
                                    height: height / 0.55,
                                    width: width,
                                    child: layoutBottom,
                                  ),
                                ),
                                if (widgetNavigation != null) widgetNavigation!,
                              ],
                            );
                          } else {
                            return Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  child: SizedBox(
                                    width: width * 0.55,
                                    height: height,
                                    child: layoutTop,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: width * 0.56,
                                  bottom: 0,
                                  child: Container(
                                    width: 1,
                                    height: 200,
                                    color: AppPropertyColor.grey,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: width * 0.57,
                                  right: 0,
                                  child: SizedBox(
                                    height: height,
                                    child: layoutBottom,
                                  ),
                                ),
                                if (widgetNavigation != null) widgetNavigation!,
                              ],
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
