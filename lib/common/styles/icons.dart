// ignore_for_file: constant_identifier_names
import 'package:flutter/widgets.dart';

/// 荔枝图标字体
/// 参照 README.md 文档说明使用
/// 命名规则：线体：icon；圆形线框：icon_outlined；圆形填充：icon_rounded
class Icons {
  Icons._();

  static const String _kFontFam = 'lizhi';
  static const String? _kFontPkg = null;

  static const IconData timer_outlined = IconData(0xe090, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData play_outlined = IconData(0xe00e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData shutdown = IconData(0xe633, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData play = IconData(0xe9bf, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pause = IconData(0xe9be, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
