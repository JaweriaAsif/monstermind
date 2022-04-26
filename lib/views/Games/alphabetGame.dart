import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/gameController.dart';
import 'package:monstermind/controllers/games/alphabet.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameOptionTile.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';

import 'package:provider/provider.dart';

import '../tts.dart';

late List list;
late List alphabets;
late List c;
late int ques;

class AlphabetGame extends StatefulWidget {
  const AlphabetGame({Key? key}) : super(key: key);

  @override
  State<AlphabetGame> createState() => _AlphabetGameState();
}

class _AlphabetGameState extends State<AlphabetGame> {
  List<alphabetOptions> options = [];

  @override
  Widget build(BuildContext context) {
    c = get4colors();

    list = context.read<CardContent>().getList("alphabets");
    alphabets = GameController().getlistof4(list);
    ques = GameController().getquest(alphabets);

    setTtsConfig();
    flutterTts.speak(
        "Select the alphabet ${alphabets[ques].toString().substring(0, 1)}");

    options = [
      alphabetOptions(
        index: 0,
      ),
      alphabetOptions(
        index: 1,
      ),
      alphabetOptions(
        index: 2,
      ),
      alphabetOptions(
        index: 3,
      ),
    ];
    return Game(
      question: "Select the alphabet from the audio",
      onPressed: () {
        flutterTts.speak(
            "Select the alphabet ${alphabets[ques].toString().substring(0, 1)}");
      },
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => TextGameOptionRow(
          tile1: options[index * 2],
          tile2: options[index * 2 + 1],
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
      textcolor: c[index],
      text: alphabets[index],
      ontap: () {
        isCorrect = Alphabet().actionOnAns(
          ques: alphabets[ques].toString().substring(0, 1),
          ans: alphabets[index].toString().substring(0, 1),
          context: context,
        );
        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
    );
  }
}
