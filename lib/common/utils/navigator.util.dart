
/// 路由路径定义
class NavigatorPath {
  NavigatorPath._();

  /// Flutter 老年模式
  static const String mainPage = 'MainPage';
  static const secondPage = 'SecondPage';
}

/// 路由跳转方法工具集
class NavigatorUtil {
  /// 返回上一页
  ///
  /// [result] 返回结果
  static pop({Object? result}) {
    // NavigatorLzflutter.pop();
  }

  /// 跳转到 Flutter 老年模式页
  static pushFlutterOlderModelPage() {
    // NavigatorLzflutter.push(
    //   NavigatorPath.flutterOlderModelPage,
    // );
  }

}
