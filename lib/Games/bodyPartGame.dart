import 'package:flutter/material.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameoptionTile.dart';

class BodyPartGame extends StatefulWidget {
  const BodyPartGame({Key? key}) : super(key: key);

  @override
  State<BodyPartGame> createState() => _BodyPartGameState();
}

class _BodyPartGameState extends State<BodyPartGame> {
  List<GameOptionTile> options = [];
  @override
  Widget build(BuildContext context) {
    options = [
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/arm.png',
        text: 'Arm',
        ontap: () {
          Navigator.pop(context);
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/nose.png',
        text: 'Nose',
        ontap: () {},
      ),
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/ear.png',
        text: 'Ear',
        ontap: () {},
      ),
      GameOptionTile(
        height: 110,
        imgPath: 'assets/images/foot.png',
        text: 'Foot',
        ontap: () {},
      ),
    ];
    return Game(
      question: "Select the body part from the audio",
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
