import 'package:flutter/material.dart';
import 'package:flutter_2021/common/utils/navigator.util.dart';
import 'package:flutter_2021/modules/main/controller/main_controller.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text('首页'),
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        shadowColor: Colors.transparent,
        centerTitle: true,
        // actions: <Widget>[
        // _getExitButton(),
        // ],
        backgroundColor: Colors.red,
        foregroundColor: Colors.black,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          DemoPage(),
          _getFloatButton(),
        ],
      ),
    );
  }
}

class DemoPage extends GetView<MainController> {
  DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(context) => Scaffold(
        body: Center(
          child: GetBuilder<MainController>(
            builder: (MainController playerController) {
              return Text("${controller.count}");
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => controller.add(),
        ),
      );
}

///悬浮窗
Widget _getFloatButton() {
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
      child: TextButton(child: Text("跳转"), onPressed: () {
        BoostNavigator.instance.push(NavigatorPath.secondPage);

      }),
    ),
  );
}
