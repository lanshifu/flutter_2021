import 'package:dokit/dokit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2021/page/home_page.dart';

void main() => runApp(MyApp());
// void main() => {
//       DoKit.runApp(
//           app: DoKitApp(MyApp()),
//           // 是否在release包内使用，默认release包会禁用
//           useInRelease: true,
//           releaseAction: () => {
//                 // release模式下执行该函数，一些用到runZone之类实现的可以放到这里，该值为空则会直接调用系统的runApp(MyApp())，
//               })
//     };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorLight: Colors.green,
        accentColor: Colors.orange,
        splashColor: Colors.yellow,
        primaryColor: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page 3'),
    );
  }
}
