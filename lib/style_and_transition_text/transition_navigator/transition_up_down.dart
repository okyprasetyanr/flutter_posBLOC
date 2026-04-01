import 'package:flutter/widgets.dart';
import 'package:flutter_pos/routes/routes.dart';

final Map<String, WidgetBuilder> appRoutes = routesPage;

Future navUpDownTransition(
  BuildContext context,
  String? routeName,
  bool replace, {
  WidgetBuilder? builder,
}) {
  final routeBuilder = builder ?? appRoutes[routeName];

  if (routeBuilder == null) {
    throw Exception("Route tidak ditemukan");
  }

  final route = PageRouteBuilder(
    settings: RouteSettings(name: routeName),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Builder(builder: (innerContext) => routeBuilder(innerContext));
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;

      var tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: Curves.ease));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );

  if (replace) {
    return Navigator.pushReplacement(context, route);
  } else {
    return Navigator.push(context, route);
  }
}
