import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/games/colour.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/controllers/games/questions.dart';

import 'package:monstermind/views/Games/gameOptionTile.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:monstermind/views/loadingCircle.dart';
import 'package:provider/provider.dart';

import '../tts.dart';
import 'picgame.dart';

late bool isCorrect;
late int quest;
late List colours;
List list = [];
List ques = [];

class ColourGame extends StatefulWidget {
  const ColourGame({Key? key}) : super(key: key);

  @override
  State<ColourGame> createState() => _ColourGameState();
}

class _ColourGameState extends State<ColourGame> {
  // List<GameOptionTile> options = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    isLoading = true;

    context.watch<CardContent>().coloursList;
    list = context.watch<CardContent>().getList("colours");
    ques = context.read<Questions>().colorsQuest;

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

    quest = Random().nextInt(ques.length);
    colours = GameController().getlistof4colours(ques[quest].color, list);

    setTtsConfig();
    flutterTts.speak("What color is this?");

    return PicGame(
      question: "What color is this?",
      onPressed: () {
        flutterTts.speak("What color is this?");
      },
      questionimagepath: ques[quest].imgPath,
      questionimagewidth: 150,
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => GameOptionRow(
          tile1: colourOptions(index: index * 2),
          tile2: colourOptions(index: index * 2 + 1),
        ),
        itemCount: 2,
      ),
    );
  }
}

class colourOptions extends StatelessWidget {
  colourOptions({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    return GameOptionTile(
      height: 70,
      imgPath: colours[index].imgPath,
      text: colours[index].text,
      textcolor: colours[index].color,
      ontap: () {
        isCorrect = Colour().actionOnAns(
            ques: ques[quest].color,
            ans: colours[index].color,
            color: colours[index].text,
            context: context);
        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
    );
  }
}
