import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'key')
enum ScaleSize {
  small('small', 'Small', 0.8),
  medium('medium', 'Medium', 1),
  large('large', 'Large', 1.2),
  extraLarge('extra_large', 'Extra Large', 1.4);

  const ScaleSize(this.key, this.label, this.size);

  final String key;
  final String label;
  final double size;
}
