import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class LayoutTopBottom extends StatelessWidget {
  final Widget layoutTop;
  final Widget layoutBottom;
  final Widget? widgetNavigation;
  final Widget? contentAppBar;
  final String? title;
  final RefreshCallback refreshIndicator;

  const LayoutTopBottom({
    super.key,
    required this.layoutTop,
    required this.layoutBottom,
    required this.widgetNavigation,
    required this.refreshIndicator,
    this.contentAppBar,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double availableHeight =
        mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom -
        (contentAppBar != null ? 44 : 0);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: title != null
            ? AppBar(
                actions: [
                  if (contentAppBar != null)
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: contentAppBar!,
                    ),
                ],
                toolbarHeight: 44,
                leadingWidth: 250,
                leading: Row(
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      ),
                      icon: const Icon(Icons.arrow_back_ios_new, size: 25),
                      constraints: const BoxConstraints(),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppPropertyColor.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(title!, style: titleTextStyleWhite),
                    ),
                  ],
                ),
              )
            : null,
        backgroundColor: AppPropertyColor.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: RefreshIndicator(
              onRefresh: refreshIndicator,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: availableHeight,
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
                                  child: SizedBox(
                                    height: height * 0.6,
                                    width: width,
                                    child: layoutTop,
                                  ),
                                ),
                                Positioned(
                                  top: height * 0.61, // Mulai setelah layoutTop
                                  bottom: 0,
                                  child: SizedBox(
                                    width: width,
                                    child:
                                        layoutBottom, // layoutBottom akan mengisi sisa 40% layar
                                  ),
                                ),
                                if (widgetNavigation != null) widgetNavigation!,
                              ],
                            );
                          } else {
                            // --- Mode Landscape ---
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
                                    color: AppPropertyColor.grey,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
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
