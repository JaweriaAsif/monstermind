import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/numberGame.dart';
import 'package:monstermind/views/tts.dart';

class Number {
  bool questioncheck(String ques, String ans) => ques == ans;

  bool actionOnAns({
    required String ques,
    required String ans,
    required context,
  }) {
    if (questioncheck(ques, ans)) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const NumberGame()),
      );

      return true;
    } else {
      flutterTts.speak("${ans} ... How many are these?");
      return false;
    }
  }
}
