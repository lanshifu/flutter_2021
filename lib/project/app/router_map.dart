import 'package:flutter/material.dart';
import 'package:flutter_2021/common/utils/navigator.util.dart';
import 'package:flutter_2021/modules/second/second_page.dart';
import 'package:flutter_2021/project/app/navigator_widget.dart';
import 'package:flutter_2021/modules/main/main_page.dart';

Map<String, NavigatorRouteFactory> routerMap = <String, NavigatorRouteFactory>{
  NavigatorPath.mainPage: (RouteSettings settings, String? uniqueId) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (_, __, ___) => MainPage(),
    );
  },
  NavigatorPath.secondPage: (RouteSettings settings, String? uniqueId) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (_, __, ___) => SecondPage(),
    );
  },
};
