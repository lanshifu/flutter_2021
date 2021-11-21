import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_2021/modules/main/controller/main_controller.dart';
import 'package:flutter_2021/project/app/navigator_widget.dart';
import 'package:flutter_2021/project/app/router_map.dart';
import 'package:flutter_2021/common/styles/themes_datas.dart';
import 'package:flutter_2021/widgets/scroll/lizhi_refresher_footer.dart';
import 'package:flutter_2021/widgets/scroll/lizhi_refresher_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());

    return NavigatorWidget(
      routerMap,
      appBuilder: (Widget home) {
        return RefreshConfiguration(
          springDescription:
              const SpringDescription(mass: 4.4, stiffness: 150, damping: 16),
          headerTriggerDistance: 100.0,
          shouldFooterFollowWhenNotFull: (LoadStatus? mode) => true,
          footerBuilder: generateRefresherFooter,
          headerBuilder: () => const RefresherHeader(),
          child: MaterialApp(
            home: home,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              canvasColor: Colors.white,
              outlinedButtonTheme: ThemeDatas.outlinedButtonTheme,
            ),
            builder: (BuildContext context, Widget? child) {
              // 初始化响应式布局工具
              ScreenUtil.init(
                BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                designSize: const Size(375, 667),
                orientation: Orientation.portrait,
              );
              return child!;
            },
          ),
        );
      },
    );
  }
}
