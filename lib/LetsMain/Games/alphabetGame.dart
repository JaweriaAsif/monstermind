import 'package:flutter/material.dart';
import 'package:monstermind/LetsMain/Games/game.dart';
import 'package:monstermind/LetsMain/Games/gameoptionTile.dart';
import 'package:monstermind/LetsMain/optionTile.dart';

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
      //numbers
      GameOptionTile(
        imgPath: 'assets/images/H.png',
        text: '',
        color: const Color(0xffffffff),
        ontap: () {
          Navigator.pop(context);
        },
      ),
      // alphabets
      GameOptionTile(
        imgPath: 'assets/images/R.png',
        text: '',
        color: const Color(0xffffffff),
        ontap: () {},
      ),

      //shapes
      GameOptionTile(
        imgPath: 'assets/images/Z.png',
        text: '',
        color: const Color(0xffffffff),
        ontap: () {},
      ),
      //colours
      GameOptionTile(
        imgPath: 'assets/images/B.png',
        text: '',
        color: const Color(0xffffffff),
        ontap: () {},
      ),
    ];
    return Game(
      question: "Select the correct alphabet from the audio",
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
