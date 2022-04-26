import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/gameController.dart';
import 'package:monstermind/controllers/games/number.dart';
import 'package:monstermind/views/Games/gameOptionTile.dart';
import 'package:monstermind/views/Games/picgame.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:provider/provider.dart';

import '../tts.dart';

late List list;
late List c;
late List numbers;
late int quest;
late bool isCorrect;

class NumberGame extends StatefulWidget {
  const NumberGame({Key? key}) : super(key: key);

  @override
  State<NumberGame> createState() => _NumberGameState();
}

class _NumberGameState extends State<NumberGame> {
  List<numberOptions> options = [];

  @override
  Widget build(BuildContext context) {
    context.watch<CardContent>().list;
    list = context.read<CardContent>().getList("numbers");
    numbers = GameController().getlistof4(list);
    quest = GameController().getquest(numbers);
    c = get4colors();

    setTtsConfig();
    flutterTts.speak("How many are these?");

    options = [
      numberOptions(index: 0),
      numberOptions(index: 1),
      numberOptions(index: 2),
      numberOptions(index: 3),
    ];

    return PicGame(
      question: "How many are these?",
      onPressed: () {
        flutterTts.speak("How many are these?");
      },
      questionimagepath: numbers[quest].imgPath,
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

class numberOptions extends StatelessWidget {
  numberOptions({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    return TextGameOptionTile(
      text: numbers[index].topText.toString(),
      bottomtext: numbers[index].bottomText,
      ontap: () {
        isCorrect = Number().actionOnAns(
          ans: numbers[index].topText.toString(),
          ques: numbers[quest].topText.toString(),
          context: context,
        );
        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
      textcolor: c[index],
    );
  }
}
