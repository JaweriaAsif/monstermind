import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameOptionTile.dart';
import 'package:monstermind/controllers/pointsProvider.dart';

import 'package:provider/provider.dart';

import '../../controllers/tts.dart';

List list = [];
late List alphabets;
late List c;
late int ques;

class AlphabetGame extends StatefulWidget {
  const AlphabetGame({Key? key}) : super(key: key);

  @override
  State<AlphabetGame> createState() => _AlphabetGameState();
}

class _AlphabetGameState extends State<AlphabetGame> {
  @override
  Widget build(BuildContext context) {
    c = get4colors();
    context.watch<CardContent>().list;
    list = context.read<CardContent>().getList("alphabets");
    alphabets = GameController().getlistof4(list);
    ques = GameController().getquest(alphabets);

    setTtsConfig();
    flutterTts.speak(
        "Select the alphabet ${alphabets[ques].toString().substring(0, 1)}");

    return Game(
      question: "Select the alphabet from the audio",
      onPressed: () {
        flutterTts.speak(
            "Select the alphabet ${alphabets[ques].toString().substring(0, 1)}");
      },
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => TextGameOptionRow(
          tile1: alphabetOptions(index: index * 2),
          tile2: alphabetOptions(index: index * 2 + 1),
        ),
        itemCount: 2,
      ),
    );
  }
}

class alphabetOptions extends StatelessWidget {
  alphabetOptions({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    bool isCorrect;
    return TextGameOptionTile(
      isAlphabet: true,
      textcolor: c[index],
      text: alphabets[index],
      ontap: () {
        isCorrect = GameController().actionOnAns(
          ques: alphabets[ques].toString().substring(0, 1),
          ans: alphabets[index].toString().substring(0, 1),
          context: context,
          navTo: const AlphabetGame(),
          speak:
              "${alphabets[index].toString().substring(0, 1)} ... Select the alphabet ${alphabets[ques].toString().substring(0, 1)}",
        );
        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
    );
  }
}
