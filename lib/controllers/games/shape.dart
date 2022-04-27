import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/bodyPartGame.dart';
import 'package:monstermind/views/Games/shapeGame.dart';

import 'package:monstermind/views/tts.dart';

class Shape {
  bool questioncheck(String ques, String ans) => ques == ans;

  bool actionOnAns({
    required String ques,
    required String ans,
    required context,
  }) {
    if (questioncheck(ques, ans)) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ShapeGame()),
      );

      return true;
    } else {
      flutterTts.speak("${ans} ... What shape is this?");
      return false;
    }
  }
}
