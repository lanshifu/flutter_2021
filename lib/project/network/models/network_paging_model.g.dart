// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_paging_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPagingModel<T> _$NetworkPagingModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NetworkPagingModel<T>(
      list: (json['list'] as List<dynamic>).map(fromJsonT).toList(),
      page: Page.fromJson(json['page'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkPagingModelToJson<T>(
  NetworkPagingModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'list': instance.list.map(toJsonT).toList(),
      'page': instance.page,
    };

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      isLastPage: json['isLastPage'] as bool,
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'isLastPage': instance.isLastPage,
    };
