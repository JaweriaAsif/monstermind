import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameoptionTile.dart';
import 'package:monstermind/controllers/pointsProvider.dart';
import 'package:monstermind/views/loadingCircle.dart';
import 'package:monstermind/views/tts.dart';
import 'package:provider/provider.dart';

List list = [];
List bodyparts = [];
late int quest;
late bool isCorrect;

class BodyPartGame extends StatefulWidget {
  const BodyPartGame({Key? key}) : super(key: key);

  @override
  State<BodyPartGame> createState() => _BodyPartGameState();
}

class _BodyPartGameState extends State<BodyPartGame> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    isLoading = true;
    context.read<CardContent>().list;
    list = context.watch<CardContent>().getList("body");

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

    bodyparts = GameController().getlistof4(list);
    quest = GameController().getquest(bodyparts);

    setTtsConfig();
    flutterTts.speak("Select the ${bodyparts[quest].text}");

    return Game(
      question: "Select the body part from the audio",
      onPressed: () {
        flutterTts.speak("Select the ${bodyparts[quest].text}");
      },
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => GameOptionRow(
          tile1: bodyPartOptions(index: 2 * index),
          tile2: bodyPartOptions(index: 2 * index + 1),
        ),
        itemCount: 2,
      ),
    );
  }
}

class bodyPartOptions extends StatelessWidget {
  bodyPartOptions({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    return GameOptionTile(
      height: 110,
      imgPath: bodyparts[index].imgPath,
      text: bodyparts[index].text,
      ontap: () {
        isCorrect = GameController().actionOnAns(
          ans: bodyparts[index].text,
          ques: bodyparts[quest].text,
          context: context,
          navTo: const BodyPartGame(),
          speak:
              "${bodyparts[index].text} ... Select the ${bodyparts[quest].text}",
        );
        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
    );
  }
}
