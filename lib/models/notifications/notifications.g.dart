// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    Notifications(
      items: (json['data'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'data': instance.items,
    };
