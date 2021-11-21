import 'package:dio/dio.dart';

/// 自定义异常
class NetworkException implements Exception {
  NetworkException(this._message);

  factory NetworkException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return BadRequestException('请求取消');
      case DioErrorType.connectTimeout:
        return BadRequestException('网络不给力，请稍候再试');
      case DioErrorType.sendTimeout:
        return BadRequestException('网络不给力，请稍候再试');
      case DioErrorType.receiveTimeout:
        return BadRequestException('网络不给力，请稍候再试');
      case DioErrorType.response:
        try {
          final int? errorCode = error.response?.statusCode;
          switch (errorCode) {
            case 400:
              return BadRequestException('请求错误');
            case 401:
              return UnauthorizedException('没有权限');
            case 403:
              return UnauthorizedException('服务器拒绝执行');
            case 404:
              return UnauthorizedException('无法连接服务器');
            case 405:
              return UnauthorizedException('请求方法被禁止');
            case 500:
              return UnauthorizedException('服务器内部错误');
            case 502:
              return UnauthorizedException('无效的请求');
            case 503:
              return UnauthorizedException('服务器暂时无法处理请求');
            case 505:
              return UnauthorizedException('不支持HTTP协议请求');
            default:
              return NetworkException(error.response?.statusMessage ?? '');
          }
        } on Exception catch (_) {
          return NetworkException('未知错误');
        }
      case DioErrorType.other:
        return BadRequestException('网络不给力，请稍候再试');
      default:
        return NetworkException(error.message);
    }
  }

  final String _message;

  @override
  String toString() => _message;
}

/// 请求错误
class BadRequestException extends NetworkException {
  BadRequestException(String message) : super(message);
}

/// 未认证异常
class UnauthorizedException extends NetworkException {
  UnauthorizedException(String message) : super(message);
}
