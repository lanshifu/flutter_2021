
import 'dart:async';

import 'package:flutter/services.dart';

class PluginHello {
  static const MethodChannel _channel =
      const MethodChannel('plugin_hello');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
