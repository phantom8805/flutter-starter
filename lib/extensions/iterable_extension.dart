import 'package:collection/collection.dart';

extension IterableExtension<E> on Iterable<E> {
  E? firstWhere(bool Function(E element) test) => firstWhereOrNull(test);

  Iterable<E> filter(bool Function(E element) test) => where(test);

  List<E> filterAsList(bool Function(E element) test) => where(test).toList();

  List<T> mapAsList<T>(T Function(E element) test) => map(test).toList();

  bool has(bool Function(E element) test) => any(test);

  bool hasIndex(int index) => index >= 0 && index < length;
}
