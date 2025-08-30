import 'package:flutterstarter/enums/message_report_level.dart';
import 'package:flutterstarter/enums/message_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Message {
  final String key;
  final String label;
  final MessageType type;
  final MessageReportLevel reportLevel;
  final bool isReadable;
  final String? relatedTo;
  final String? content;
  final List<MessageAction>? actions;

  Message({
    required this.label,
    required this.type,
    required this.reportLevel,
    this.actions,
    this.relatedTo,
    this.content,
    this.key = '',
    this.isReadable = false,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class MessageAction {
  final String link;
  final String title;

  MessageAction({required this.link, required this.title});

  factory MessageAction.fromJson(Map<String, dynamic> json) => _$MessageActionFromJson(json);

  Map<String, dynamic> toJson() => _$MessageActionToJson(this);
}
