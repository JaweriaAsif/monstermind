import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameoptionTile.dart';
import 'package:monstermind/views/loadingCircle.dart';
import 'package:monstermind/views/tts.dart';
import 'package:monstermind/controllers/pointsProvider.dart';
import 'package:provider/provider.dart';

List list = [];
List animals = [];
late int quest;
late bool isCorrect;

class AnimalGame extends StatefulWidget {
  const AnimalGame({Key? key}) : super(key: key);

  @override
  State<AnimalGame> createState() => _AnimalGameState();
}

class _AnimalGameState extends State<AnimalGame> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    isLoading = true;

    context.watch<CardContent>().animalsList;
    list = context.read<CardContent>().getList("animals");

    if (list.isNotEmpty) {
      isLoading = false;
    }

    if (isLoading) {
      return Scaffold(
        backgroundColor: bgYellow,
        body: Center(
          child: LoadingCircle(color: darkYellow),
        ),
      );
    }

    animals = GameController().getlistof4(list);
    quest = GameController().getquest(animals);

    setTtsConfig();
    flutterTts.speak("Select the animal ${animals[quest].text}");

    return Game(
      question: "Select the animal from the audio",
      onPressed: () {
        flutterTts.speak("Select the animal ${animals[quest].text}");
      },
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => GameOptionRow(
          tile1: animalOptions(index: index * 2),
          tile2: animalOptions(index: index * 2 + 1),
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
        isCorrect = GameController().actionOnAns(
          ans: animals[index].text,
          ques: animals[quest].text,
          context: context,
          navTo: const AnimalGame(),
          speak:
              "${animals[index].text} ... Select the animal ${animals[quest].text}",
        );

        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
    );
  }
}
