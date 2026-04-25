import 'package:flutter/cupertino.dart';
import 'package:flutter_pos/template/dynamic_layout_top_bottom.dart';

class HistoryLayout extends StatefulWidget {
  final Widget layoutTop1;
  final Widget layoutTop2;
  final Widget layoutBottom1;
  final Widget layoutBottom2;
  final Widget? widgetNavigation;
  final Widget? contentAppBar;
  final Widget header;
  final String? title;
  final Color? color;
  final RefreshCallback refreshIndicator;
  const HistoryLayout({
    super.key,
    required this.layoutTop1,
    required this.layoutTop2,
    required this.layoutBottom1,
    required this.layoutBottom2,
    required this.widgetNavigation,
    required this.refreshIndicator,
    this.contentAppBar,
    this.title,
    this.color,
    required this.header,
  });

  @override
  State<HistoryLayout> createState() => _HistoryLayoutState();
}

class _HistoryLayoutState extends State<HistoryLayout> {
  PageController pageControllerTop = PageController();
  PageController pageControllerBottom = PageController();
  final currentPage = ValueNotifier<bool>(true);
  @override
  void dispose() {
    if (mounted) {
      currentPage.dispose();
      pageControllerTop.dispose();
      pageControllerBottom.dispose();
    }
    super.dispose();
  }

  void _gotoPage(bool page) {
    int goto = page ? 0 : 1;
    currentPage.value = page;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageControllerTop.hasClients && pageControllerBottom.hasClients) {
        pageControllerTop.animateToPage(
          goto,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        pageControllerBottom.animateToPage(
          goto,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      refreshIndicator: widget.refreshIndicator,
      layoutTop: topLayout(),
      layoutBottom: bottomLayout(),
      widgetNavigation: null,
      color: widget.color,
      title: widget.title,
      contentAppBar: widget.contentAppBar,
    );
  }

  Widget topLayout() {
    return Column(
      children: [
        widget.header,
        Expanded(
          child: PageView(
            controller: pageControllerTop,
            physics: NeverScrollableScrollPhysics(),
            children: [widget.layoutTop1, widget.layoutTop2],
          ),
        ),
      ],
    );
  }

  Widget bottomLayout() {
    return Column(
      children: [
        Expanded(
          child: PageView(
            reverse: true,
            controller: pageControllerBottom,
            physics: NeverScrollableScrollPhysics(),
            children: [widget.layoutBottom1, widget.layoutBottom2],
          ),
        ),
      ],
    );
  }
}
