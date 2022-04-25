import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/alphabetGame.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:monstermind/views/tts.dart';

class Alphabet {
  bool questioncheck(String ques, String ans) => ques == ans;

  actionOnAns({
    required String ques,
    required String ans,
    required context,
  }) {
    if (questioncheck(ques, ans)) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AlphabetGame()),
      );
      context.read<PointsProvider>().addPoints(10);
    } else {
      flutterTts.speak("${ans} ... Select the alphabet ${ques}");
    }
  }
}
