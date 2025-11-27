import 'package:flutterstarter/enums/is_dark_mode_option.dart';
import 'package:flutterstarter/enums/scale_size.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_settings.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AppSettings {
  ScaleSize scaleSize;
  IsDarkModeOption isDarkTheme;

  AppSettings({required this.scaleSize, required this.isDarkTheme});

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);
}
