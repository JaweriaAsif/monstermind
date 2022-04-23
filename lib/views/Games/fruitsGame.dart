import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/gameController.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameoptionTile.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:monstermind/views/tts.dart';
import 'package:provider/provider.dart';

class FruitsGame extends StatefulWidget {
  const FruitsGame({Key? key}) : super(key: key);

  @override
  State<FruitsGame> createState() => _FruitsGameState();
}

class _FruitsGameState extends State<FruitsGame> {
  List<GameOptionTile> options = [];
  // List list = CardContent(from: "fruits").list;

  @override
  Widget build(BuildContext context) {
    context.watch<CardContent>().list;
    List list = context.read<CardContent>().getList("fruits");
    List fruits = GameController().getlistof4(list);
    int answer = GameController().getquest(fruits);
    setTtsConfig();
    flutterTts.speak("Select the ${fruits[answer].text}");
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
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${fruits[0].text} ... Select the fruit ${fruits[answer].text}");
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
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${fruits[1].text} ... Select the fruit ${fruits[answer].text}");
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
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${fruits[2].text} ... Select the fruit ${fruits[answer].text}");
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
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak(
                "${fruits[3].text} ... Select the fruit ${fruits[answer].text}");
          }
        },
      ),
    ];
    return Game(
      question: "Select the fruit from the audio",
      onPressed: () {
        flutterTts.speak("Select the fruit ${fruits[answer].text}");
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
