import 'dart:math';

import 'package:flutter/material.dart';

class GameController {
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

  List getlistof4colours(Color color, List list) {
    List l = [];
    for (var i = 0; i < list.length; i++) {
      if (list[i].color == color) {
        l.add(list[i]);
        list.removeAt(i);
        break;
      }
    }
    for (var i = 0; i < 3; i++) {
      int ran = Random().nextInt(list.length);
      l.add(list[ran]);
      list.removeAt(ran);
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
