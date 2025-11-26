// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => AppSettings(
  scaleSize: $enumDecode(_$ScaleSizeEnumMap, json['scale_size']),
  isDarkTheme: $enumDecode(_$IsDarkModeOptionEnumMap, json['is_dark_theme']),
);

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'scale_size': _$ScaleSizeEnumMap[instance.scaleSize]!,
      'is_dark_theme': _$IsDarkModeOptionEnumMap[instance.isDarkTheme]!,
    };

const _$ScaleSizeEnumMap = {
  ScaleSize.small: 'small',
  ScaleSize.medium: 'medium',
  ScaleSize.large: 'large',
  ScaleSize.extraLarge: 'extra_large',
};

const _$IsDarkModeOptionEnumMap = {
  IsDarkModeOption.no: 0,
  IsDarkModeOption.yes: 1,
};
