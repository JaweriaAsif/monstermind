import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/controllers/games/number.dart';
import 'package:monstermind/controllers/games/questions.dart';
import 'package:monstermind/views/Games/gameOptionTile.dart';
import 'package:monstermind/views/Games/picgame.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:monstermind/views/loadingCircle.dart';
import 'package:provider/provider.dart';

import '../tts.dart';

List list = [];
List c = [];
List ques = [];
List numbers = [];
late int quest;
late bool isCorrect;

class NumberGame extends StatefulWidget {
  const NumberGame({Key? key}) : super(key: key);

  @override
  State<NumberGame> createState() => _NumberGameState();
}

class _NumberGameState extends State<NumberGame> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    isLoading = true;

    context.watch<CardContent>().list;
    list = context.read<CardContent>().getList("numbers");
    ques = context.watch<Questions>().numbersQuest;

    if (list.isNotEmpty && ques.isNotEmpty) {
      isLoading = false;
    }

    if (isLoading) {
      return Scaffold(
        backgroundColor: bgYellow,
        body: Center(
          child: LoadingCircle(color: darkYellow),
        ),
      );
    }

    quest = GameController().getquest(ques);
    numbers = GameController()
        .getlistof4numbers(ques[quest].topText.toString(), list);

    c = get4colors();

    setTtsConfig();
    flutterTts.speak("How many are these?");

    return PicGame(
      question: "How many are these?",
      onPressed: () {
        flutterTts.speak("How many are these?");
      },
      questionimagepath: ques[quest].imgPath,
      questionimagewidth: 200,
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => TextGameOptionRow(
          tile1: numberOptions(index: index * 2),
          tile2: numberOptions(index: index * 2 + 1),
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
        isCorrect = GameController().actionOnAns(
          ans: numbers[index].topText.toString(),
          ques: ques[quest].topText.toString(),
          context: context,
          navTo: const NumberGame(),
          speak: "${numbers[index].topText.toString()} ... How many are these?",
        );
        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
      textcolor: c[index],
    );
  }
}
