import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/fruitsGame.dart';

import 'package:monstermind/views/tts.dart';

class Fruit {
  bool questioncheck(String ques, String ans) => ques == ans;

  bool actionOnAns({
    required String ques,
    required String ans,
    required context,
  }) {
    if (questioncheck(ques, ans)) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const FruitsGame()),
      );

      return true;
    } else {
      flutterTts.speak("${ans} ... Select the fruit ${ques}");
      return false;
    }
  }
}
