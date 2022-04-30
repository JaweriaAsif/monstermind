import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/views/tts.dart';

class GameController {
  bool questioncheck(String ques, String ans) => ques == ans;

  bool actionOnAns({
    required String ques,
    required String ans,
    required String speak,
    required Widget navTo,
    required context,
  }) {
    if (questioncheck(ques, ans)) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => navTo),
      );
      return true;
    } else {
      flutterTts.speak(speak);
      return false;
    }
  }

  int getquest(List list) {
    return Random().nextInt(list.length);
  }

  List getlistof4(List list) {
    List l = [];
    int i = 0;
    int j;
    while (i != 4) {
      j = Random().nextInt(list.length);
      if (!l.contains(list[j])) {
        l.add(list[j]);
        i++;
      }
    }
    return l;
  }

  List getlistof4colours(String color, List list) {
    List l = [];
    for (var i = 0; i < list.length; i++) {
      if (list[i].text == color) {
        l.add(list[i]);

        break;
      }
    }
    int i = 0;
    while (i != 3) {
      int ran = Random().nextInt(list.length);
      if (!l.contains(list[ran]) && list[ran].text != color) {
        l.add(list[ran]);
        i++;
      }
    }
    l.shuffle();
    return l;
  }

  List getlistof4shapes(String shape, List list) {
    List l = [];
    for (var i = 0; i < list.length; i++) {
      if (list[i].text == shape) {
        l.add(list[i]);

        break;
      }
    }
    int i = 0;
    while (i != 3) {
      int ran = Random().nextInt(list.length);
      if (!l.contains(list[ran]) && list[ran].text != shape) {
        l.add(list[ran]);
        i++;
      }
    }
    l.shuffle();
    return l;
  }

  List getlistof4numbers(String number, List list) {
    List l = [];
    for (var i = 0; i < list.length; i++) {
      if (list[i].topText.toString() == number) {
        l.add(list[i]);

        break;
      }
    }
    int i = 0;
    while (i != 3) {
      int ran = Random().nextInt(list.length);
      if (!l.contains(list[ran]) && list[ran].topText.toString() != number) {
        l.add(list[ran]);
        i++;
      }
    }
    l.shuffle();
    return l;
  }
}
