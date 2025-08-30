mixin DisplayName {
  String get displayName {
    if (this is Enum) {
      final camelCaseName = (this as Enum).name;

      return camelCaseName
          .replaceAllMapped(
              // Add whitespaces
              RegExp(r'[a-z][A-Z]'),
              (Match m) => "${m[0]?[0]} ${m[0]?[1]}")
          .replaceFirstMapped(
              //Capitalize
              RegExp(r'[a-z]'),
              (Match m) => m[0]!.toUpperCase());
    }

    return '';
  }
}
