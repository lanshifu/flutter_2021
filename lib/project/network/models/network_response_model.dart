import 'package:json_annotation/json_annotation.dart';

import 'network_exception_model.dart';

part 'network_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NetworkResponseModel<T> {
  NetworkResponseModel({
    required this.code,
    this.data,
    this.prompt,
    this.performance,
  });

  factory NetworkResponseModel.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$NetworkResponseModelFromJson(json, fromJsonT);

  final int code;
  final T? data;
  final String? performance;
  final NetworkExceptionPromptModel? prompt;

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$NetworkResponseModelToJson(this, toJsonT);
}
