import 'package:flutter/material.dart';

class LayoutTopBottom extends StatelessWidget {
  final Widget widgetTop;
  final Widget widgetBottom;
  final Widget widgetNavigation;
  final RefreshCallback refreshIndicator;

  const LayoutTopBottom({
    super.key,
    required this.widgetTop,
    required this.widgetBottom,
    required this.widgetNavigation,
    required this.refreshIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: RefreshIndicator(
          onRefresh: refreshIndicator,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 20,
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
                                child: widgetTop,
                              ),
                            ),
                            Positioned(
                              top: height * 0.615,
                              bottom: 0,
                              child: SizedBox(
                                height: height / 0.55,
                                width: width,
                                child: widgetBottom,
                              ),
                            ),
                            widgetNavigation,
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
                                child: widgetTop,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: width * 0.56,
                              bottom: 0,
                              child: Container(
                                width: 1, // biar sepanjang parent
                                height: 200, // ketebalan garis
                                color: Colors.grey[400],
                                margin: const EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: width * 0.57,
                              right: 0,
                              child: SizedBox(
                                height: height,
                                child: widgetBottom,
                              ),
                            ),
                            widgetNavigation,
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
    );
  }
}
