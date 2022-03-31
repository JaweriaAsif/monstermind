import 'package:flutter/material.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameoptionTile.dart';

import 'picgame.dart';

class ShapeGame extends StatefulWidget {
  const ShapeGame({Key? key}) : super(key: key);

  @override
  State<ShapeGame> createState() => _ShapeGameState();
}

class _ShapeGameState extends State<ShapeGame> {
  List<GameOptionTile> options = [];
  @override
  Widget build(BuildContext context) {
    options = [
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/star.png',
        text: 'Star',
        ontap: () {
          Navigator.pop(context);
        },
      ),
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/circle.png',
        text: 'Circle',
        ontap: () {},
      ),
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/square.png',
        text: 'Square',
        ontap: () {},
      ),
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/triangle.png',
        text: 'Triangle',
        ontap: () {},
      ),
    ];
    return PicGame(
      question: "What shape is this?",
      questionimagepath: 'assets/images/ball.png',
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
