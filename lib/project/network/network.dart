import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_2021/common/configs/network.config.dart';
import 'package:flutter_2021/project/network/interceptors/response_interceptor.dart';

import 'custom_log_print.dart';
import 'interceptors/connection_interceptor.dart';
import 'interceptors/request_interceptor.dart';

class Network {
  /// Network 单例，用于发起网络请求
  factory Network() => instance;

  Network._();

  static Network instance = Network._();

  final Dio _dio = Dio();

  get dio => _dio;

  bool isInitEd = false;

  /// 初始化
  Future<void> init() async {
    isInitEd = true;
    final String baseUrl = NetworkConfig.baseUrl;
    // 配置参数初始化
    _dio.options = BaseOptions(
      baseUrl: baseUrl ,
      contentType: 'application/json',
      connectTimeout: NetworkConfig.connectTimeout,
      receiveTimeout: NetworkConfig.receiveTimeout,
      validateStatus: (int? status) {
        return status != null && status >= 200 && status < 300;
      },
    );
    // 添加拦截器
    if (NetworkConfig.enableLog) {
      _dio.interceptors.add(LogInterceptor(responseBody: true, logPrint: customLogPrint, requestHeader: true));
    }
    _dio.interceptors.add(RequestInterceptor());
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(ConnectionInterceptor());

    // 在调试模式下开启代理，并禁用 HTTPS 证书校验
    if (NetworkConfig.enableProxy) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.findProxy = (Uri uri) {
          return 'PROXY ${NetworkConfig.proxyIp}:${NetworkConfig.proxyPort}';
        };
        client.badCertificateCallback = (_, __, ___) => true;
      };
    }
  }

  /// 发起 get 请求
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (!isInitEd) {
      await init();
    }
    final Response<dynamic> response = await _dio.get(
      uri,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data;
  }

  /// 发起 post 请求
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (!isInitEd) {
      await init();
    }
    final Response<dynamic> response = await _dio.post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response.data;
  }
}
