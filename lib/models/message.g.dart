// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  label: json['label'] as String,
  type: $enumDecode(_$MessageTypeEnumMap, json['type']),
  reportLevel: $enumDecode(_$MessageReportLevelEnumMap, json['report_level']),
  actions: (json['actions'] as List<dynamic>?)
      ?.map((e) => MessageAction.fromJson(e as Map<String, dynamic>))
      .toList(),
  relatedTo: json['related_to'] as String?,
  content: json['content'] as String?,
  key: json['key'] as String? ?? '',
  isReadable: json['is_readable'] as bool? ?? false,
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
  'type': _$MessageTypeEnumMap[instance.type]!,
  'report_level': _$MessageReportLevelEnumMap[instance.reportLevel]!,
  'is_readable': instance.isReadable,
  'related_to': instance.relatedTo,
  'content': instance.content,
  'actions': instance.actions,
};

const _$MessageTypeEnumMap = {
  MessageType.http: 'http',
  MessageType.app: 'app',
  MessageType.notification: 'notification',
};

const _$MessageReportLevelEnumMap = {
  MessageReportLevel.info: 'info',
  MessageReportLevel.warning: 'warning',
  MessageReportLevel.error: 'error',
};

MessageAction _$MessageActionFromJson(Map<String, dynamic> json) =>
    MessageAction(link: json['link'] as String, title: json['title'] as String);

Map<String, dynamic> _$MessageActionToJson(MessageAction instance) =>
    <String, dynamic>{'link': instance.link, 'title': instance.title};
