import 'package:json_annotation/json_annotation.dart';

enum IsDarkModeOption {
  @JsonValue(0)
  no('No', false),
  @JsonValue(1)
  yes('Yes', true);

  const IsDarkModeOption(this.label, this.value);

  final String label;
  final bool value;
}
