import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/Flashcards/cardContent.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameoptionTile.dart';
import 'package:monstermind/Points&Profile/pointsProvider.dart';
import 'package:provider/provider.dart';

import 'picgame.dart';

class ShapeGame extends StatefulWidget {
  const ShapeGame({Key? key}) : super(key: key);

  @override
  State<ShapeGame> createState() => _ShapeGameState();
}

class _ShapeGameState extends State<ShapeGame> {
  List<GameOptionTile> options = [];
  List list = CardContent(from: "shapes").list;
  List<ObjectShape> ques = [
    ObjectShape(
      shape: "Circle",
      imgPath: "assets/images/ball.png",
    ),
    ObjectShape(
      shape: "Circle",
      imgPath: "assets/images/orange.png",
    ),
    ObjectShape(
      shape: "Star",
      imgPath: "assets/images/starfish.png",
    ),
    ObjectShape(
      shape: "Triangle",
      imgPath: "assets/images/pizza.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    int answer = Random().nextInt(ques.length);
    List shapes = CardContent().getlistof4shapes(ques[answer].shape, list);

    options = [
      GameOptionTile(
        height: 60,
        imgPath: shapes[0].imgPath,
        text: shapes[0].text,
        textcolor: shapes[0].color,
        ontap: () {
          if (shapes[0].text == ques[answer].shape) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ShapeGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          }
        },
      ),
      GameOptionTile(
        height: 60,
        imgPath: shapes[1].imgPath,
        text: shapes[1].text,
        textcolor: shapes[1].color,
        ontap: () {
          if (shapes[1].text == ques[answer].shape) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ShapeGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          }
        },
      ),
      GameOptionTile(
        height: 60,
        imgPath: shapes[2].imgPath,
        text: shapes[2].text,
        textcolor: shapes[2].color,
        ontap: () {
          if (shapes[2].text == ques[answer].shape) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ShapeGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          }
        },
      ),
      GameOptionTile(
        height: 60,
        imgPath: shapes[3].imgPath,
        text: shapes[3].text,
        textcolor: shapes[3].color,
        ontap: () {
          if (shapes[3].text == ques[answer].shape) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ShapeGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          }
        },
      ),
    ];
    return PicGame(
      question: "What shape is this?",
      questionimagepath: ques[answer].imgPath,
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

class ObjectShape {
  String imgPath;
  String shape;

  ObjectShape({
    required this.shape,
    required this.imgPath,
  });
}
