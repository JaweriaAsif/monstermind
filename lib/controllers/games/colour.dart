import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/colourGame.dart';

import 'package:monstermind/views/tts.dart';

class Colour {
  bool questioncheck(String ques, String ans) => ques == ans;

  bool actionOnAns({
    required String ques,
    required String ans,
    required String color,
    required context,
  }) {
    if (questioncheck(ques, ans)) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ColourGame()),
      );

      return true;
    } else {
      flutterTts.speak("$color ... What color is this?");
      return false;
    }
  }
}
