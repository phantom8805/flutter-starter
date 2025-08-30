import 'dart:async';

class Debounce<T> {
  final int timeout;
  final void Function(T value) onValue;

  T? _value;
  Timer? _timer;

  Debounce({required this.onValue, this.timeout = 500});

  Duration get _duration => Duration(milliseconds: timeout);

  set value(T val) {
    _value = val;
    _timer?.cancel();
    _timer = Timer(_duration, () => onValue(_value as T));
  }
}
