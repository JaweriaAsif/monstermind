import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/comparisonGame.dart';
import 'package:monstermind/views/tts.dart';

class Comparison {
  double small = 60;
  double medium = 110;
  double large = 220;

  late List<double> heights = [medium, small, large];

  // double randomheight() {
  //   int ran = Random().nextInt(heights.length);
  //   double h = heights[ran];
  //   heights.removeAt(ran);
  //   return h;
  // }

  List<double> shuffleHeights() {
    heights.shuffle();
    return heights;
  }

  double quest(String question) {
    if (question == "largest") {
      return large;
    }
    return small;
  }
}
