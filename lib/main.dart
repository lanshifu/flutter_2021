import 'package:flutter/material.dart';
import 'package:flutter_2021/project/app/app.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'modules/main/main_page.dart';


class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

void main() {
  // 在 runApp 之前确保 BoostFlutterBinding 初始化
  CustomFlutterBinding();
  runApp(const MyApp());
  // runApp(const MainPage());
}
