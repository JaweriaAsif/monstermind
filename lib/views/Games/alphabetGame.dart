import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameOptionTile.dart';

import 'package:provider/provider.dart';

import '../Points&Profile/pointsProvider.dart';
import '../tts.dart';

class AlphabetGame extends StatefulWidget {
  const AlphabetGame({Key? key}) : super(key: key);

  @override
  State<AlphabetGame> createState() => _AlphabetGameState();
}

class _AlphabetGameState extends State<AlphabetGame> {
  List<TextGameOptionTile> options = [];
  // List list = CardContent(from: "alphabets").list;
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
    context.watch<CardContent>().list;
    List list = context.read<CardContent>().getList("alphabets");
    List alphabets = CardContent().getlistof4(list);
    int answer = CardContent().getquest(alphabets);

    setTtsConfig();
    flutterTts.speak(
        "Select the alphabet ${alphabets[answer].toString().substring(0, 1)}");

    // List color = CardContent().getlistof4(colors);
    options = [
      TextGameOptionTile(
        textcolor: colors[Random().nextInt(colors.length)],
        text: alphabets[0],
        ontap: () {
          if (0 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AlphabetGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${alphabets[0].toString().substring(0, 1)} ... Select the alphabet ${alphabets[answer].toString().substring(0, 1)}");
          }
        },
      ),
      TextGameOptionTile(
        textcolor: colors[Random().nextInt(colors.length)],
        text: alphabets[1],
        ontap: () {
          if (1 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AlphabetGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${alphabets[1].toString().substring(0, 1)} ... Select the alphabet ${alphabets[answer].toString().substring(0, 1)}");
          }
        },
      ),
      TextGameOptionTile(
        textcolor: colors[Random().nextInt(colors.length)],
        text: alphabets[2],
        ontap: () {
          if (2 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AlphabetGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${alphabets[2].toString().substring(0, 1)} ... Select the alphabet ${alphabets[answer].toString().substring(0, 1)}");
          }
        },
      ),
      TextGameOptionTile(
        textcolor: colors[Random().nextInt(colors.length)],
        text: alphabets[3],
        ontap: () {
          if (3 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AlphabetGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${alphabets[3].toString().substring(0, 1)} ... Select the alphabet ${alphabets[answer].toString().substring(0, 1)}");
          }
        },
      ),
    ];
    return Game(
      question: "Select the alphabet from the audio",
      onPressed: () {
        flutterTts.speak(
            "Select the alphabet ${alphabets[answer].toString().substring(0, 1)}");
      },
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
