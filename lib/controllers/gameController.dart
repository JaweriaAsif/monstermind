import 'dart:math';

import 'package:flutter/material.dart';

class GameController {
  int getquest(List list) {
    return Random().nextInt(list.length);
  }

  List getlistof4(List list) {
    List l = [];
    for (var i = 0; i < 4; i++) {
      int ran = Random().nextInt(list.length);
      l.add(list[ran]);
      list.removeAt(ran);
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
}
