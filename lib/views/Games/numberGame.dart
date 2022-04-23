import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/gameController.dart';
import 'package:monstermind/views/Games/gameOptionTile.dart';
import 'package:monstermind/views/Games/picgame.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:provider/provider.dart';

import '../tts.dart';

class NumberGame extends StatefulWidget {
  const NumberGame({Key? key}) : super(key: key);

  @override
  State<NumberGame> createState() => _NumberGameState();
}

class _NumberGameState extends State<NumberGame> {
  List<TextGameOptionTile> options = [];
  // List list = CardContent(from: "numbers").list;

  @override
  Widget build(BuildContext context) {
    context.watch<CardContent>().list;
    List list = context.read<CardContent>().getList("numbers");
    List numbers = GameController().getlistof4(list);
    int answer = GameController().getquest(numbers);
    setTtsConfig();
    flutterTts.speak("How many are these?");
    options = [
      TextGameOptionTile(
        text: numbers[0].topText.toString(),
        bottomtext: numbers[0].bottomText,
        ontap: () {
          if (0 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NumberGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts
                .speak("${numbers[0].bottomText} ... How many are these?");
          }
        },
        textcolor: colors[Random().nextInt(colors.length)],
      ),
      TextGameOptionTile(
        text: numbers[1].topText.toString(),
        bottomtext: numbers[1].bottomText,
        ontap: () {
          if (1 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NumberGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts
                .speak("${numbers[1].bottomText} ... How many are these?");
          }
        },
        textcolor: colors[Random().nextInt(colors.length)],
      ),
      TextGameOptionTile(
        text: numbers[2].topText.toString(),
        bottomtext: numbers[2].bottomText,
        ontap: () {
          if (2 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NumberGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts
                .speak("${numbers[2].bottomText} ... How many are these?");
          }
        },
        textcolor: colors[Random().nextInt(colors.length)],
      ),
      TextGameOptionTile(
        text: numbers[3].topText.toString(),
        bottomtext: numbers[3].bottomText,
        ontap: () {
          if (3 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NumberGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts
                .speak("${numbers[3].bottomText} ... How many are these?");
          }
        },
        textcolor: colors[Random().nextInt(colors.length)],
      ),
    ];
    return PicGame(
      question: "How many are these?",
      onPressed: () {
        flutterTts.speak("How many are these?");
      },
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
