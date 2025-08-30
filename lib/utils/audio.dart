import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class Audio {
  final player = AudioPlayer();

  bool _isPlaying = false;

  Future<void> play(String filePath) async {
    if (_isPlaying) return;
    await player.play(AssetSource(filePath));
    _isPlaying = true;
  }

  Future<void> dispose() async {
    if (kIsWeb) return;
    await player.dispose();
  }

  Future<void> stop() async {
    if (kIsWeb) return;

    await player.stop();
    _isPlaying = false;
  }
}
