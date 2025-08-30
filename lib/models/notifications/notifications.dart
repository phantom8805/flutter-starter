import 'package:flutterstarter/models/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Notifications {
  @JsonKey(name: 'data')
  final List<Message> items;

  Notifications({required this.items});

  factory Notifications.fromJson(Map<String, dynamic> json) => _$NotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}
