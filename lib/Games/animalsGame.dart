import 'package:flutter/material.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameoptionTile.dart';

class AnimalGame extends StatefulWidget {
  const AnimalGame({Key? key}) : super(key: key);

  @override
  State<AnimalGame> createState() => _AnimalGameState();
}

class _AnimalGameState extends State<AnimalGame> {
  List<GameOptionTile> options = [];
  @override
  Widget build(BuildContext context) {
    options = [
      //numbers
      GameOptionTile(
        imgPath: 'assets/images/cow.png',
        text: 'Cow',
        ontap: () {
          Navigator.pop(context);
        },
      ),
      // alphabets
      GameOptionTile(
        imgPath: 'assets/images/whale.png',
        text: 'Whale',
        ontap: () {},
      ),

      //shapes
      GameOptionTile(
        imgPath: 'assets/images/elephant.png',
        text: 'Elephant',
        ontap: () {},
      ),
      //colours
      GameOptionTile(
        imgPath: 'assets/images/duck.png',
        text: 'Duck',
        ontap: () {},
      ),
    ];
    return Game(
      question: "Select the animal from the audio",
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
