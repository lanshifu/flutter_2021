// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_exception_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkExceptionModel _$NetworkExceptionModelFromJson(
        Map<String, dynamic> json) =>
    NetworkExceptionModel(
      code: json['code'] as int,
      prompt: NetworkExceptionPromptModel.fromJson(
          json['prompt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkExceptionModelToJson(
        NetworkExceptionModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'prompt': instance.prompt,
    };

NetworkExceptionPromptModel _$NetworkExceptionPromptModelFromJson(
        Map<String, dynamic> json) =>
    NetworkExceptionPromptModel(
      msg: json['msg'] as String,
      type: json['type'] as int,
    );

Map<String, dynamic> _$NetworkExceptionPromptModelToJson(
        NetworkExceptionPromptModel instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'type': instance.type,
    };
