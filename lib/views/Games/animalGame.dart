import 'package:flutter/material.dart';
import 'package:monstermind/controllers//cardContent.dart';
import 'package:monstermind/controllers/gameController.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameoptionTile.dart';
import 'package:monstermind/views/tts.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:provider/provider.dart';

class AnimalGame extends StatefulWidget {
  const AnimalGame({Key? key}) : super(key: key);

  @override
  State<AnimalGame> createState() => _AnimalGameState();
}

class _AnimalGameState extends State<AnimalGame> {
  List<GameOptionTile> options = [];
  // List list = CardContent(from: "animals").list;

  @override
  Widget build(BuildContext context) {
    List list = context.watch<CardContent>().getList("animals");
    List animals = GameController().getlistof4(list);
    int answer = GameController().getquest(animals);

    setTtsConfig();
    flutterTts.speak("Select the animal ${animals[answer].text}");
    options = [
      GameOptionTile(
        height: 110,
        imgPath: animals[0].imgPath,
        text: animals[0].text,
        ontap: () {
          if (0 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AnimalGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${animals[0].text} ... Select the animal ${animals[answer].text}");
          }
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: animals[1].imgPath,
        text: animals[1].text,
        ontap: () {
          if (1 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AnimalGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${animals[1].text} ... Select the animal ${animals[answer].text}");
          }
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: animals[2].imgPath,
        text: animals[2].text,
        ontap: () {
          if (2 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AnimalGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${animals[2].text} ... Select the animal ${animals[answer].text}");
          }
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: animals[3].imgPath,
        text: animals[3].text,
        ontap: () {
          if (3 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AnimalGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${animals[3].text} ... Select the animal ${animals[answer].text}");
          }
        },
      ),
    ];
    return Game(
      question: "Select the animal from the audio",
      onPressed: () {
        flutterTts.speak("Select the animal ${animals[answer].text}");
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
