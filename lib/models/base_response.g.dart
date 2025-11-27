// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
    BaseResponse<T>(
      _$nullableGenericFromJson(json['data'], fromJsonT),
      json['message'] as String?,
      BaseResponse._errorsFromJson(json['errors'] as Map<String, List<String>>?),
    );

T? _$nullableGenericFromJson<T>(Object? input, T Function(Object? json) fromJson) =>
    input == null ? null : fromJson(input);
