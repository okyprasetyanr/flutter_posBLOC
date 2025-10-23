import 'package:flutter/widgets.dart';
import 'package:flutter_pos/routes/routes.dart';

final Map<String, WidgetBuilder> appRoutes = routesPage;

Future navUpDownTransition(
  BuildContext context,
  String routeName,
  bool replace,
) {
  final builder = appRoutes[routeName];
  if (builder == null) throw Exception("Route $routeName tidak ditemukan");

  final route = PageRouteBuilder(
    settings: RouteSettings(name: routeName),
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );

  if (replace) {
    return Navigator.pushReplacement(context, route);
  } else {
    return Navigator.push(context, route);
  }
}
