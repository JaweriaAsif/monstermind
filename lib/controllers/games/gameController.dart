import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/controllers/tts.dart';

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

  bool checkDrawing({
    required String ques,
    required String ans,
    required String speak,
    // required Widget navTo,
    required context,
  }) {
    List<String> ansList = ans.split(", ");

    ques = ques.toLowerCase();
    ansList[0] = ansList[0].toLowerCase();
    ansList[1] = ansList[1].toLowerCase();
    ansList[2] = ansList[2].toLowerCase();

    print("answer: " + ansList[0]);
    print("ques: " + ques);

    if (questioncheck(ques, ansList[0]) ||
        questioncheck(ques, ansList[1]) ||
        questioncheck(ques, ansList[2])) {
      // Navigator.pop(context);
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => navTo),
      // );
      // flutterTts.speak("hellloooooooo hi");
      return true;
    } else {
      flutterTts.speak("Incorrect, you have drawn ${ansList[0]} ... $speak");
      return false;
    }
  }

  int getquest(List list) {
    return Random().nextInt(list.length);
  }

  int getnum(int lastNum) {
    return Random().nextInt(lastNum) + 1;
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
