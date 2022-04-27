import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/bodyPartGame.dart';

import 'package:monstermind/views/tts.dart';

class bodyPart {
  bool questioncheck(String ques, String ans) => ques == ans;

  bool actionOnAns({
    required String ques,
    required String ans,
    required context,
  }) {
    if (questioncheck(ques, ans)) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const BodyPartGame()),
      );

      return true;
    } else {
      flutterTts.speak("${ans} ... Select the ${ques}");
      return false;
    }
  }
}
