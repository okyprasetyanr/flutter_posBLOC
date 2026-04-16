import 'package:flutter/material.dart';
import 'package:flutter_pos/routes/routes.dart';

final Map<String, WidgetBuilder> appRoutes = routesPage;

Future navUpDownTransition(
  BuildContext context,
  String routeName,
  bool replace, {
  Object? arguments,
}) {
  final routeBuilder = appRoutes[routeName];

  if (routeBuilder == null) {
    throw Exception("Route tidak ditemukan");
  }

  final route = PageRouteBuilder(
    settings: RouteSettings(name: routeName, arguments: arguments),
    pageBuilder: (context, animation, secondaryAnimation) {
      return routeBuilder(context);
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
    return Navigator.pushAndRemoveUntil(context, route, (route) => false);
  } else {
    return Navigator.push(context, route);
  }
}
