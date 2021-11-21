/// 网络相关配置项
class NetworkConfig {
  /// 是否启用代理
  static const bool enableProxy = false;

  /// 是否启用日志
  static const bool enableLog = true;

  /// 代理服务 IP 地址
  static const String proxyIp = '192.168.20.240';

  /// 代理服务端口
  static const int proxyPort = 8888;

  /// 最大连接时间
  static const int connectTimeout = 15000;

  /// 最大接收时间
  static const int receiveTimeout = 5000;

  static const String baseUrl = "";
}
