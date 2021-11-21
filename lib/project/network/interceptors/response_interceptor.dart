import 'package:dio/dio.dart';
import 'package:flutter_2021/project/network/index.dart';

/// 响应处理拦截器
class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (response.data != null && response.data is Map && response.data['code'] == 0) {
      handler.next(response);
    } else {
      final NetworkExceptionModel exception = NetworkExceptionModel.fromJson(response.data);
      handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          response: response,
          error: exception.prompt.msg,
        ),
      );
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final NetworkException networkException = NetworkException.create(err);
    err.error = networkException;
    super.onError(err, handler);
  }
}
