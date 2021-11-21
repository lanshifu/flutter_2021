import 'package:flutter/material.dart';
import 'package:flutter_2021/modules/main/controller/main_controller.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.w,
        title: const Text('Second Page'),
        titleTextStyle: TextStyle(
          fontSize: 30.sp,
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
      padding: EdgeInsets.fromLTRB(16.w, 16.w, 0, 0),
      child: TextButton(
          child: const Text("跳转"),
          onPressed: () {
            BoostNavigator.instance.pop();
          },
      ),
    ),
  );
}
