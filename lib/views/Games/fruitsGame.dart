import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/controllers/games/fruits.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameOptionTile.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:monstermind/views/loadingCircle.dart';
import 'package:monstermind/views/tts.dart';
import 'package:provider/provider.dart';

late int quest;
List fruits = [];
List list = [];
late bool isCorrect;

class FruitsGame extends StatefulWidget {
  const FruitsGame({Key? key}) : super(key: key);

  @override
  State<FruitsGame> createState() => _FruitsGameState();
}

class _FruitsGameState extends State<FruitsGame> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    isLoading = true;

    context.read<CardContent>().list;
    list = context.watch<CardContent>().getList("fruits");

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

    fruits = GameController().getlistof4(list);
    quest = GameController().getquest(fruits);

    setTtsConfig();
    flutterTts.speak("Select the ${fruits[quest].text}");

    return Game(
      question: "Select the fruit from the audio",
      onPressed: () {
        flutterTts.speak("Select the fruit ${fruits[quest].text}");
      },
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => GameOptionRow(
          tile1: fruitOptions(index: index * 2),
          tile2: fruitOptions(index: index * 2 + 1),
        ),
        itemCount: 2,
      ),
    );
  }
}

class fruitOptions extends StatelessWidget {
  fruitOptions({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    return GameOptionTile(
      height: 110,
      imgPath: fruits[index].imgPath,
      text: fruits[index].text,
      ontap: () {
        isCorrect = Fruit().actionOnAns(
          ques: fruits[quest].text,
          ans: fruits[index].text,
          context: context,
        );
        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
    );
  }
}
