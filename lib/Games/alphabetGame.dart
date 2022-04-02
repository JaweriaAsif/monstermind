import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/Flashcards/cardContent.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameOptionTile.dart';

class AlphabetGame extends StatefulWidget {
  const AlphabetGame({Key? key}) : super(key: key);

  @override
  State<AlphabetGame> createState() => _AlphabetGameState();
}

class _AlphabetGameState extends State<AlphabetGame> {
  List<TextGameOptionTile> options = [];
  List list = CardContent(from: "alphabets").list;
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
    List alphabets = CardContent().getlistof4(list);
    int answer = CardContent().getquest(alphabets);

    // List color = CardContent().getlistof4(colors);
    options = [
      TextGameOptionTile(
        textcolor: colors[Random().nextInt(colors.length)],
        text: alphabets[0],
        ontap: () {
          if (0 == answer) {
            setState(() {});
            // Navigator.pop(context);
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => const AlphabetGame()),
            // );
          }
        },
      ),
      TextGameOptionTile(
        textcolor: colors[Random().nextInt(colors.length)],
        text: alphabets[1],
        ontap: () {
          if (1 == answer) {
            setState(() {});
            // Navigator.pop(context);
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => const AlphabetGame()),
            // );
          }
        },
      ),
      TextGameOptionTile(
        textcolor: colors[Random().nextInt(colors.length)],
        text: alphabets[2],
        ontap: () {
          if (2 == answer) {
            setState(() {});
            // Navigator.pop(context);
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => const AlphabetGame()),
            // );
          }
        },
      ),
      TextGameOptionTile(
        textcolor: colors[Random().nextInt(colors.length)],
        text: alphabets[3],
        ontap: () {
          if (3 == answer) {
            setState(() {});
            // Navigator.pop(context);
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => const AlphabetGame()),
            // );
          }
        },
      ),
    ];
    return Game(
      question: "Select the alphabet from the audio",
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
