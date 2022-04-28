import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/animalGame.dart';

import 'package:monstermind/views/tts.dart';

class Animal {
  bool questioncheck(String ques, String ans) => ques == ans;

  bool actionOnAns({
    required String ques,
    required String ans,
    required context,
  }) {
    if (questioncheck(ques, ans)) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AnimalGame()),
      );

      return true;
    } else {
      flutterTts.speak("${ans} ... Select the animal ${ques}");
      return false;
    }
  }
}
