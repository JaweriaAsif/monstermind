import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/Flashcards/cardContent.dart';
import 'package:monstermind/Games/colourGame.dart';
import 'package:monstermind/Games/gameOptionTile.dart';

import 'picgame.dart';

class NumberGame extends StatefulWidget {
  const NumberGame({Key? key}) : super(key: key);

  @override
  State<NumberGame> createState() => _NumberGameState();
}

class _NumberGameState extends State<NumberGame> {
  List<TextGameOptionTile> options = [];
  List list = CardContent(from: "numbers").list;
  List<Color> colors = const [
    Color(0xff5CD978),
    Color(0xffD9825C),
    Color(0xff28AAF2),
    Color(0xffE445B8),
    Color(0xffF11162),
    Color(0xffFF3C3C),
    Color(0xffC915D8),
  ];

  @override
  Widget build(BuildContext context) {
    List numbers = CardContent().getlistof4(list);
    int answer = CardContent().getquest(numbers);
    options = [
      TextGameOptionTile(
        text: numbers[0].topText,
        bottomtext: numbers[0].bottomText,
        ontap: () {
          if (0 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NumberGame()),
            );
          }
        },
        textcolor: colors[Random().nextInt(colors.length)],
      ),
      TextGameOptionTile(
        text: numbers[1].topText,
        bottomtext: numbers[1].bottomText,
        ontap: () {
          if (1 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NumberGame()),
            );
          }
        },
        textcolor: colors[Random().nextInt(colors.length)],
      ),
      TextGameOptionTile(
        text: numbers[2].topText,
        bottomtext: numbers[2].bottomText,
        ontap: () {
          if (2 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NumberGame()),
            );
          }
        },
        textcolor: colors[Random().nextInt(colors.length)],
      ),
      TextGameOptionTile(
        text: numbers[3].topText,
        bottomtext: numbers[3].bottomText,
        ontap: () {
          if (3 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NumberGame()),
            );
          }
        },
        textcolor: colors[Random().nextInt(colors.length)],
      ),
    ];
    return PicGame(
      question: "How many are these?",
      questionimagepath: numbers[answer].imgPath,
      questionimagewidth: 200,
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => TextGameOptionRow(
          tile1: options[index * 2],
          tile2: options[index * 2 + 1],
        ),
        itemCount: 2,
      ),
    );
  }
}

class ObjectNumber {
  String imgPath;
  String number;

  ObjectNumber({
    required this.number,
    required this.imgPath,
  });
}
