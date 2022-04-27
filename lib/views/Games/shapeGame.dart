import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/controllers/games/questions.dart';
import 'package:monstermind/controllers/games/shape.dart';
import 'package:monstermind/models/objectShape.dart';
import 'package:monstermind/views/Games/gameoptionTile.dart';
import 'package:monstermind/views/Games/picgame.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:monstermind/views/loadingCircle.dart';
import 'package:monstermind/views/tts.dart';
import 'package:provider/provider.dart';

late bool isCorrect;
late int quest;
late List shapes;
List list = [];
List ques = [];

class ShapeGame extends StatefulWidget {
  const ShapeGame({Key? key}) : super(key: key);

  @override
  State<ShapeGame> createState() => _ShapeGameState();
}

class _ShapeGameState extends State<ShapeGame> {
  List<shapeOptions> options = [];

  // = [
  //   ObjectShape(
  //     shape: "Circle",
  //     imgPath: "assets/images/ball.png",
  //   ),
  //   ObjectShape(
  //     shape: "Circle",
  //     imgPath: "assets/images/orange.png",
  //   ),
  //   ObjectShape(
  //     shape: "Star",
  //     imgPath: "assets/images/starfish.png",
  //   ),
  //   ObjectShape(
  //     shape: "Triangle",
  //     imgPath: "assets/images/pizza.png",
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    bool isLoading = list.isEmpty || ques.isEmpty;
    context.watch<CardContent>().shapesList;
    ques = context.watch<Questions>().shapesQuest;
    list = context.read<CardContent>().getList("shapes");

    //if loading, show circular loading thing
    if (isLoading) {
      return Scaffold(
        backgroundColor: bgYellow,
        body: Center(
          child: LoadingCircle(color: darkYellow),
        ),
      );
    }

    quest = Random().nextInt(ques.length);
    shapes = GameController().getlistof4shapes(ques[quest].shape, list);

    setTtsConfig();
    flutterTts.speak("What shape is this?");

    options = [
      shapeOptions(index: 0),
      shapeOptions(index: 1),
      shapeOptions(index: 2),
      shapeOptions(index: 3),
    ];

    return PicGame(
      question: "What shape is this?",
      onPressed: () {
        flutterTts.speak("What shape is this?");
      },
      questionimagepath: ques[quest].imgPath,
      questionimagewidth: 200,
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => GameOptionRow(
          tile1: options[index * 2],
          tile2: options[index * 2 + 1],
        ),
        itemCount: 2,
      ),
    );
  }
}

class shapeOptions extends StatelessWidget {
  shapeOptions({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    return GameOptionTile(
      height: 70,
      imgPath: shapes[index].imgPath,
      text: shapes[index].text,
      textcolor: shapes[index].color,
      ontap: () {
        isCorrect = Shape().actionOnAns(
            ques: ques[quest].shape, ans: shapes[index].text, context: context);
        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
    );
  }
}
