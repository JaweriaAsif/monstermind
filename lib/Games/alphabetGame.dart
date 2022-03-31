import 'package:flutter/material.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameoptionTile.dart';

class AlphabetGame extends StatefulWidget {
  const AlphabetGame({Key? key}) : super(key: key);

  @override
  State<AlphabetGame> createState() => _AlphabetGameState();
}

class _AlphabetGameState extends State<AlphabetGame> {
  List<GameOptionTile> options = [];
  @override
  Widget build(BuildContext context) {
    options = [
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/H.png',
        text: '',
        ontap: () {
          Navigator.pop(context);
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/R.png',
        text: '',
        ontap: () {},
      ),
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/Z.png',
        text: '',
        ontap: () {},
      ),
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/B.png',
        text: '',
        ontap: () {},
      ),
    ];
    return Game(
      question: "Select the alphabet from the audio",
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
