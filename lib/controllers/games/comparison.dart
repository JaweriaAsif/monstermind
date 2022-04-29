import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/comparisonGame.dart';
import 'package:monstermind/views/tts.dart';

class Comparison {
  final List<double> heights = [110, 60, 220];
  bool actionOnAns({
    required String question,
    required double height,
    required context,
  }) {
    if (quest(question) == height) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ComparisonGame()),
      );
      return true;
    } else {
      flutterTts.speak("Select the $question.");
      return false;
    }
  }

  double randomheight() {
    int ran = Random().nextInt(heights.length);
    double h = heights[ran];
    heights.removeAt(ran);
    return h;
  }

  double quest(String question) {
    if (question == "largest") {
      return 220;
    }
    return 60;
  }
}
