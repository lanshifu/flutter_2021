import 'package:json_annotation/json_annotation.dart';

part 'network_exception_model.g.dart';

@JsonSerializable()
class NetworkExceptionModel {
  NetworkExceptionModel({
    required this.code,
    required this.prompt,
  });

  factory NetworkExceptionModel.fromJson(Map<String, dynamic> json) => _$NetworkExceptionModelFromJson(json);

  final int code;
  final NetworkExceptionPromptModel prompt;

  Map<String, dynamic> toJson() => _$NetworkExceptionModelToJson(this);
}

@JsonSerializable()
class NetworkExceptionPromptModel {
  NetworkExceptionPromptModel({
    required this.msg,
    required this.type,
  });

  factory NetworkExceptionPromptModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkExceptionPromptModelFromJson(json);

  final String msg;
  final int type;

  Map<String, dynamic> toJson() => _$NetworkExceptionPromptModelToJson(this);
}
