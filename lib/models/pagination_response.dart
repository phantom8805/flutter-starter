import 'package:json_annotation/json_annotation.dart';

part "pagination_response.g.dart";

@JsonSerializable(genericArgumentFactories: true, fieldRename: FieldRename.snake, createToJson: false)
class PaginationResponse<T> {
  final MetaDataResponse meta;
  final List<T> data;

  PaginationResponse({required this.meta, required this.data});

  factory PaginationResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) dataFromJson) =>
      _$PaginationResponseFromJson(json, dataFromJson);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MetaDataResponse {
  final int currentPage;
  final int perPage;
  final int lastPage;

  MetaDataResponse({required this.currentPage, required this.perPage, required this.lastPage});

  factory MetaDataResponse.fromJson(Map<String, dynamic> json) => _$MetaDataResponseFromJson(json);

  factory MetaDataResponse.empty() => _$MetaDataResponseFromJson({'current_page': 0, 'per_page': 0, 'last_page': 0});

  Map<String, dynamic> toJson() => _$MetaDataResponseToJson(this);
}
