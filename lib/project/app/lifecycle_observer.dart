import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter/material.dart';
class AppLifecycleObserver with GlobalPageVisibilityObserver {
  @override
  void onBackground(Route route) {
    super.onBackground(route);
    print('AppLifecycleObserver - ${route.settings.name} - onBackground');
  }

  @override
  void onForeground(Route route) {
    super.onForeground(route);
    print('AppLifecycleObserver ${route.settings.name} - onForground');
  }

  @override
  void onPagePush(Route route) {
    super.onPagePush(route);
    print('AppLifecycleObserver - ${route.settings.name}- onPagePush');
  }

  @override
  void onPagePop(Route route) {
    super.onPagePop(route);
    print('AppLifecycleObserver - ${route.settings.name}- onPagePop');
  }

  @override
  void onPageHide(Route route) {
    super.onPageHide(route);
    print('AppLifecycleObserver - ${route.settings.name}- onPageHide');
  }

  @override
  void onPageShow(Route route) {
    super.onPageShow(route);
    print('AppLifecycleObserver - ${route.settings.name}- onPageShow');
  }
}
