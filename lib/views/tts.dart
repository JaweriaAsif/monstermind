import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();

setTtsConfig() {
  flutterTts.setSpeechRate(0.4);
  flutterTts.setVolume(1);
  flutterTts.setLanguage("en-US");
}
