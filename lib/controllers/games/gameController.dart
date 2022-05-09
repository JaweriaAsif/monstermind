import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/controllers/tts.dart';
import 'package:monstermind/views/Games/alphabetDraw.dart';
import 'package:monstermind/views/Games/numbersDraw.dart';

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => navTo),
      );
      return true;
    } else {
      flutterTts.speak(speak);
      return false;
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool checkDrawing({
    required String ques,
    required String ans,
    required String speak,
    required context,
    required bool isAlphabet,
  }) {
    if (isAlphabet) {
      return checkAlphabetDrawing(
          ques: ques,
          ans: ans,
          speak: speak,
          navTo: const AlphabetDrawingGame(),
          context: context);
    }
    return checkNumberDrawing(
        ques: ques,
        ans: ans,
        speak: speak,
        navTo: const NumberDrawingGame(),
        context: context);
  }

  bool checkNumberDrawing({
    required String ques,
    required String ans,
    required String speak,
    required Widget navTo,
    required context,
  }) {
    List<String> ansList = ans.split(", ");
    ques = ques.toLowerCase();
    List<bool> answers = [];
    String answer = "";

    for (int i = 0; i < ansList.length; i++) {
      if (isNumeric(ansList[i])) {
        answers.add(questioncheck(ques, ansList[i]));
      }
    }

    if (answers.contains(true)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => navTo),
      );

      return true;
    } else {
      flutterTts.speak("Incorrect, you have drawn ${ansList[0]} ... $speak");
      return false;
    }
  }

  bool checkAlphabetDrawing({
    required String ques,
    required String ans,
    required String speak,
    required Widget navTo,
    required context,
  }) {
    List<String> ansList = ans.split(", ");

    ques = ques.toLowerCase();

    List<bool> answers = [];

    for (int i = 0; i < min(3, ansList.length); i++) {
      ansList[i] = ansList[i].toLowerCase();
      answers.add(questioncheck(ques, ansList[i]));
    }

    if (answers.contains(true)) {
      // Navigator.pop(context);
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => navTo),
      // );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => navTo),
      );
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
