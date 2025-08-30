import 'package:flutterstarter/enums/message_report_level.dart';
import 'package:flutterstarter/enums/message_type.dart';
import 'package:flutterstarter/models/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, fieldRename: FieldRename.snake, createToJson: false)
class BaseResponse<T> {
  final T? data;
  final String? message;
  @JsonKey(fromJson: _errorsFromJson)
  final List<Message> errors;

  bool get hasErrors => errors.isNotEmpty;

  static List<Message> _errorsFromJson(Map<String, List<String>>? value) {
    if (value == null) return [];

    return value.entries
        .map(
            (entry) => Message(label: entry.value.first, type: MessageType.http, reportLevel: MessageReportLevel.error))
        .toList();
  }

  BaseResponse(this.data, this.message, this.errors);

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  static BaseResponse<T> errorResponse<T>(String error) {
    final message = Message(label: error, type: MessageType.http, reportLevel: MessageReportLevel.error);
    return BaseResponse<T>(null, error, [message]);
  }

  static BaseResponse<T> emptyResponse<T>() {
    return BaseResponse<T>(null, null, []);
  }
}
