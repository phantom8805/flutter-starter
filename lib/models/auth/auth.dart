import 'package:flutterstarter/models/auth/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Auth {
  final String token;
  final User user;

  Auth({required this.token, required this.user});

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
