// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppData _$AppDataFromJson(Map<String, dynamic> json) => AppData(
      appSettings:
          AppSettings.fromJson(json['app_settings'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppDataToJson(AppData instance) => <String, dynamic>{
      'user': instance.user,
      'app_settings': instance.appSettings,
    };
