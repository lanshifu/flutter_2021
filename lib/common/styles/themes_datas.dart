import 'package:flutter/material.dart';

/// 主题数据
class ThemeDatas {
  /// 边框按钮主题
  static final OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      // 禁用点击波纹
      splashFactory: NoSplash.splashFactory,
      // 文字颜色设置
      foregroundColor: MaterialStateProperty.all(Colors.black.withOpacity(.5)),
      // 字体样式
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 13.0)),
      // 边框样式
      side: MaterialStateProperty.all(BorderSide(width: 1, color: Colors.black.withOpacity(.2))),
      // 边框形状
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    ),
  );
}
