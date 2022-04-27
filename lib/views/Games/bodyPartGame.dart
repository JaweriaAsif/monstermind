import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/controllers/games/bodypart.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameoptionTile.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:monstermind/views/loadingCircle.dart';
import 'package:monstermind/views/tts.dart';
import 'package:provider/provider.dart';

List list = [];
late List bodyparts;
late int quest;
late bool isCorrect;

class BodyPartGame extends StatefulWidget {
  const BodyPartGame({Key? key}) : super(key: key);

  @override
  State<BodyPartGame> createState() => _BodyPartGameState();
}

class _BodyPartGameState extends State<BodyPartGame> {
  late List<bodyPartOptions> options;

  @override
  Widget build(BuildContext context) {
    context.watch<CardContent>().list;
    list = context.read<CardContent>().getList("body");

    bodyparts = GameController().getlistof4(list);
    quest = GameController().getquest(bodyparts);

    options = [
      bodyPartOptions(index: 0),
      bodyPartOptions(index: 1),
      bodyPartOptions(index: 2),
      bodyPartOptions(index: 3),
    ];

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
          tile1: options[2 * index],
          tile2: options[2 * index + 1],
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
        isCorrect = bodyPart().actionOnAns(
            ans: bodyparts[index].text,
            ques: bodyparts[quest].text,
            context: context);
        if (isCorrect) {
          context.read<PointsProvider>().addPoints(10);
        }
      },
    );
  }
}
