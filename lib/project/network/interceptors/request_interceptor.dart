import 'package:dio/dio.dart';

/// 请求拦截器
class RequestInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // final Header? header = await LizhiFlutterNetwork.instance.getHeader;
    //
    // options.headers = ShareUtil.generateHeaderMap(header);
    handler.next(options);
  }
}
