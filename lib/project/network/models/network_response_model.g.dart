// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponseModel<T> _$NetworkResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NetworkResponseModel<T>(
      code: json['code'] as int,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      prompt: json['prompt'] == null
          ? null
          : NetworkExceptionPromptModel.fromJson(
              json['prompt'] as Map<String, dynamic>),
      performance: json['performance'] as String?,
    );

Map<String, dynamic> _$NetworkResponseModelToJson<T>(
  NetworkResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'performance': instance.performance,
      'prompt': instance.prompt,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
