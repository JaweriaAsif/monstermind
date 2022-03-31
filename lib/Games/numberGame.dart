import 'package:flutter/material.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameoptionTile.dart';

import 'picgame.dart';

class NumberGame extends StatefulWidget {
  const NumberGame({Key? key}) : super(key: key);

  @override
  State<NumberGame> createState() => _NumberGameState();
}

class _NumberGameState extends State<NumberGame> {
  List<GameOptionTile> options = [];
  @override
  Widget build(BuildContext context) {
    options = [
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/2.png',
        text: 'Two',
        ontap: () {
          Navigator.pop(context);
        },
      ),
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/1.png',
        text: 'One',
        ontap: () {},
      ),
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/5.png',
        text: 'Five',
        ontap: () {},
      ),
      GameOptionTile(
        height: 60,
        imgPath: 'assets/images/3.png',
        text: 'Three',
        ontap: () {},
      ),
    ];
    return PicGame(
      question: "How many are these?",
      questionimagepath: 'assets/images/3trees.png',
      questionimagewidth: 300,
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
