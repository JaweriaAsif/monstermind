import 'package:flutter/material.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameoptionTile.dart';

import 'picgame.dart';

class ColourGame extends StatefulWidget {
  const ColourGame({Key? key}) : super(key: key);

  @override
  State<ColourGame> createState() => _ColourGameState();
}

class _ColourGameState extends State<ColourGame> {
  List<GameOptionTile> options = [];
  @override
  Widget build(BuildContext context) {
    options = [
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/blue.png',
        text: 'Blue',
        ontap: () {
          Navigator.pop(context);
        },
      ),
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/yellow.png',
        text: 'Yellow',
        ontap: () {},
      ),
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/red.png',
        text: 'Red',
        ontap: () {},
      ),
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/green.png',
        text: 'Green',
        ontap: () {},
      ),
    ];
    return PicGame(
      question: "What color is this?",
      questionimagepath: 'assets/images/balloon.png',
      questionimagewidth: 150,
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
