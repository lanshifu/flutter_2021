import 'package:dio/dio.dart';

/// 网络拦截器
/// 用于处理请求过程中不同的网络状况处理
class ConnectionInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final int? networkStatus = 1;
    if (networkStatus == 1) {
      handler.next(options);
    } else {
      handler.reject(
        DioError(
          requestOptions: options,
          error: '没有网络连接',
        ),
      );
    }
  }
}
