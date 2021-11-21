import 'package:json_annotation/json_annotation.dart';

part 'network_paging_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NetworkPagingModel<T> {
  NetworkPagingModel({
    required this.list,
    required this.page,
  });

  factory NetworkPagingModel.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$NetworkPagingModelFromJson(json, fromJsonT);

  final List<T> list;
  final Page page;

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$NetworkPagingModelToJson(this, toJsonT);
}

@JsonSerializable()
class Page {
  Page({
    required this.isLastPage,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  final bool isLastPage;

  Map<String, dynamic> toJson() => _$PageToJson(this);
}
