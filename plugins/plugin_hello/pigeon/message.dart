import 'package:pigeon/pigeon.dart';

/// flutter pub run pigeon --input pigeons/message.dart
class DemoReply {
  late String result;
}

class DemoRequest {
  late String methodName;
}

// 需要实现的api
@HostApi()
abstract class PigeonDemoApi {
  DemoReply getMessage(DemoRequest params);
  DemoReply getDeviceId();
}

// 输出配置
void configurePigeon(PigeonOptions opts) {
  opts.dartOut = './lib/PigeonDemoMessage.dart';
  opts.objcHeaderOut = 'ios/Classes/PigeonDemoMessage.h';
  opts.objcSourceOut = 'ios/Classes/PigeonDemoMessage.m';
  opts.objcOptions!.prefix = 'FLT';
  opts.javaOut =
  'android/src/main/kotlin/com/example/plugin_hello/PigeonDemoMessage.java';
  opts.javaOptions!.package = 'com.example.plugin_hello';
}