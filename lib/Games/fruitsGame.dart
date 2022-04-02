import 'package:flutter/material.dart';
import 'package:monstermind/Flashcards/cardContent.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameoptionTile.dart';

class FruitsGame extends StatefulWidget {
  const FruitsGame({Key? key}) : super(key: key);

  @override
  State<FruitsGame> createState() => _FruitsGameState();
}

class _FruitsGameState extends State<FruitsGame> {
  List<GameOptionTile> options = [];
  List list = CardContent(from: "fruits").list;

  @override
  Widget build(BuildContext context) {
    List fruits = CardContent().getlistof4(list);
    int answer = CardContent().getquest(fruits);
    options = [
      GameOptionTile(
        height: 110,
        imgPath: fruits[0].imgPath,
        text: fruits[0].text,
        ontap: () {
          if (0 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FruitsGame()),
            );
          }
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: fruits[1].imgPath,
        text: fruits[1].text,
        ontap: () {
          if (1 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FruitsGame()),
            );
          }
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: fruits[2].imgPath,
        text: fruits[2].text,
        ontap: () {
          if (2 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FruitsGame()),
            );
          }
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: fruits[3].imgPath,
        text: fruits[3].text,
        ontap: () {
          if (3 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FruitsGame()),
            );
          }
        },
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
