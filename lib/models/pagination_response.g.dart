// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponse<T> _$PaginationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationResponse<T>(
      meta: MetaDataResponse.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

MetaDataResponse _$MetaDataResponseFromJson(Map<String, dynamic> json) =>
    MetaDataResponse(
      currentPage: (json['current_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
    );

Map<String, dynamic> _$MetaDataResponseToJson(MetaDataResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'last_page': instance.lastPage,
    };
