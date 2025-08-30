import 'package:flutterstarter/models/auth/user.dart';
import 'package:flutterstarter/models/settings/app_settings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AppData {
  final User user;
  final AppSettings appSettings;

  AppData({
    required this.appSettings,
    required this.user,
  });

  factory AppData.fromJson(Map<String, dynamic> json) => _$AppDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppDataToJson(this);
}
