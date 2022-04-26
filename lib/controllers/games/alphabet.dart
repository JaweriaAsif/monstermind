import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/alphabetGame.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:monstermind/views/tts.dart';

class Alphabet {
  bool questioncheck(String ques, String ans) => ques == ans;

  bool actionOnAns({
    required String ques,
    required String ans,
    required context,
  }) {
    if (questioncheck(ques, ans)) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AlphabetGame()),
      );
      return true;
    } else {
      flutterTts.speak("${ans} ... Select the alphabet ${ques}");
      return false;
    }
  }
}
