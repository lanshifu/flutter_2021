
import 'dart:async';

import 'package:flutter/services.dart';
import 'PigeonDemoMessage.dart';

class PluginHello {
  static const MethodChannel _channel =
      const MethodChannel('plugin_hello');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  // static Future<String?> get deviceId async {
  //   final String? deviceId = await _channel.invokeMethod('getDeviceId');
  //   return deviceId;
  // }

  static Future<String?> get deviceId async {
    // 初始化请求参数
    DemoRequest requestParams = DemoRequest()..methodName = 'requestMessage';
    // 通过PigeonDemoApi实例去调用方法
    PigeonDemoApi api = PigeonDemoApi();
    DemoReply reply = await api.getDeviceId();
    return reply.result;
  }
}
