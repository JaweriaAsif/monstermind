import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/games/animal.dart';

import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameoptionTile.dart';
import 'package:monstermind/views/tts.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:provider/provider.dart';

late List list;
late List animals;
late int quest;
late bool isCorrect;

class AnimalGame extends StatefulWidget {
  const AnimalGame({Key? key}) : super(key: key);

  @override
  State<AnimalGame> createState() => _AnimalGameState();
}

class _AnimalGameState extends State<AnimalGame> {
  List<animalOptions> options = [];

  @override
  Widget build(BuildContext context) {
    list = context.watch<CardContent>().getList("animals");
    animals = GameController().getlistof4(list);
    quest = GameController().getquest(animals);

    setTtsConfig();
    flutterTts.speak("Select the animal ${animals[quest].text}");
    options = [
      animalOptions(index: 0),
      animalOptions(index: 1),
      animalOptions(index: 2),
      animalOptions(index: 3),
    ];
    return Game(
      question: "Select the animal from the audio",
      onPressed: () {
        flutterTts.speak("Select the animal ${animals[quest].text}");
      },
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

class animalOptions extends StatelessWidget {
  animalOptions({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    return GameOptionTile(
      height: 110,
      imgPath: animals[index].imgPath,
      text: animals[index].text,
      ontap: () {
        isCorrect = Animal().actionOnAns(
          ans: animals[index].text,
          ques: animals[quest].text,
          context: context,
        );

        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
    );
  }
}
