import 'package:flutterstarter/models/auth/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Auth {
  final User user;

  Auth({required this.user});

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'user': user.toJson(),
  };
}
