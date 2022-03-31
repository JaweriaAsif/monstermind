import 'package:flutter/material.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameoptionTile.dart';

class FruitsGame extends StatefulWidget {
  const FruitsGame({Key? key}) : super(key: key);

  @override
  State<FruitsGame> createState() => _FruitsGameState();
}

class _FruitsGameState extends State<FruitsGame> {
  List<GameOptionTile> options = [];
  @override
  Widget build(BuildContext context) {
    options = [
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/strawberry.png',
        text: 'Strawberry',
        ontap: () {
          Navigator.pop(context);
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/apple.png',
        text: 'Apple',
        ontap: () {},
      ),
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/orange.png',
        text: 'Orange',
        ontap: () {},
      ),
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/grapes.png',
        text: 'Grapes',
        ontap: () {},
      ),
    ];
    return Game(
      question: "Select the fruit from the audio",
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
