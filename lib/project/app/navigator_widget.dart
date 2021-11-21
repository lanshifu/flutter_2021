import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

typedef NavigatorRouteFactory = Route<dynamic>? Function(RouteSettings settings, String? uniqueId);

class NavigatorWidget extends StatelessWidget {
  final String? initialRoute;
  final Map<String, NavigatorRouteFactory> routerMap;
  final List<BoostInterceptor>? interceptors;

  final Widget Function(Widget home)? appBuilder;

  final Function? buildFunc;

  const NavigatorWidget(
      this.routerMap, {
        Key? key,
        this.appBuilder,
        this.initialRoute,
        this.buildFunc,
        this.interceptors,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (null != buildFunc) {
      buildFunc?.call();
    }
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
      initialRoute: initialRoute,
      interceptors: interceptors,
    );
  }

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    NavigatorRouteFactory? func = this.routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }
}
