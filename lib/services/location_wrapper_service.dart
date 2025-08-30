import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class LocationWrapperService {
  static const _methodChannel = MethodChannel('lyokone/location');

  Future<bool> serviceEnabled() async {
    if (!Platform.isAndroid) return false;

    try {
      final result = await _methodChannel.invokeMethod('serviceEnabled');
      return result == 1;
    } on PlatformException catch (_) {
      return false;
    }
  }

  Future<bool> requestService() async {
    if (!Platform.isAndroid) return false;

    try {
      final result = await _methodChannel.invokeMethod('requestService');
      return result == 1;
    } on PlatformException catch (_) {
      return false;
    }
  }
}
