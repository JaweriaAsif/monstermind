import 'dart:math';

import 'package:flutter/material.dart';

List<Color> colors = [
  Color(0xff5CD978),
  Color(0xffD9825C),
  Color(0xff28AAF2),
  Color(0xffE445B8),
  Color(0xffF11162),
  Color(0xffFF3C3C),
  Color(0xffC915D8),
  Color(0xff30D5C8),
  Color(0xff808080),
  Color(0xff800000),
  Color(0xffFF8929),
  Color(0xff808000),
  Color(0xffFF32AD),
  Color(0xff000066),
  Color(0xffF48C66),
  Color(0xff178f5f),
  Color(0xffFF9999),
  Color(0xff009900),
  Color(0xff498E64),
  Color(0xff9D2400),
  Color(0xffF04F50),
  Color(0xff046A97),
  Color(0xff003C78),
  Color(0xff863E54),
  Color(0xffD2974F),
  Color(0xff6D54D0),
  Color(0xff5D357C),
  Color(0xffF1970D),
  Color(0xffE27221),
  Color(0xffEE412A),
];

Color purple = const Color(0xff946DDF);
Color red = const Color(0xffEE412A);
Color darkYellow = const Color(0xffF1B111);

Color bgYellow = const Color(0xffFCE79A);
Color bgRed = const Color(0xffFA978B);

Color btnBlue = const Color(0xff2EADB5);
Color halkaBlue = const Color(0xff1D9EA6);
Color tezBlue = const Color(0xff12777D);

//String colors
String Turquoise = "0xff30D5C8";
String Red = "0xffF11162";
String Maroon = "0xff800000";
String Grey = "0xff808080";
String Orange = "0xffFF8929";
String Black = "0xff000000";
String Olive = "0xff808000";
String Yellow = "0xffF9DF00";
String Purple = "0xff8709D4";
String Blue = "0xff0585E1";
String Peach = "0xffF6C569";
String White = "0xff000000";
String Pink = "0xffFF32AD";
String Brown = "0xff9D5D09";
String Green = "0xff5CD978";

List get4colors() {
  List l = [];
  int i = 0;
  int j;
  while (i != 4) {
    j = Random().nextInt(colors.length);
    if (!l.contains(colors[j])) {
      l.add(colors[j]);
      i++;
    }
  }
  // for (int i = 0; i < 4; i++) {
  //   j = Random().nextInt(colors.length);

  //   l.add(colors[j]);
  // }
  return l;
}
