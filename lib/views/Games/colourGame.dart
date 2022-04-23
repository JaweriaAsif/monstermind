import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/gameController.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Games/gameOptionTile.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:provider/provider.dart';

import '../tts.dart';
import 'picgame.dart';

class ColourGame extends StatefulWidget {
  const ColourGame({Key? key}) : super(key: key);

  @override
  State<ColourGame> createState() => _ColourGameState();
}

class _ColourGameState extends State<ColourGame> {
  List<GameOptionTile> options = [];
  // List list = CardContent(from: "colours").list;
  List<ObjectColor> ques = [
    // ObjectColor(
    //   imgPath: "assets/images/balloon.png",
    //   color: const Color(0xffF11162),
    // ),
    ObjectColor(
      imgPath: "assets/images/strawberry.png", //
      color: const Color(0xffF11162),
    ),
    ObjectColor(
      imgPath: "assets/images/grapes.png",
      color: const Color(0xff8709D4),
    ),
    ObjectColor(
      imgPath: "assets/images/eggplant.png",
      color: const Color(0xff8709D4),
    ),
    ObjectColor(
      imgPath: "assets/images/octopus.png",
      color: const Color(0xff8709D4),
    ),
    ObjectColor(
      imgPath: "assets/images/broccoli.png", //
      color: const Color(0xff5CD978),
    ),
    ObjectColor(
      imgPath: "assets/images/giraffe.png",
      color: const Color(0xffF9DF00),
    ),
    ObjectColor(
      imgPath: "assets/images/lemon.png",
      color: const Color(0xffF9DF00),
    ),
    ObjectColor(
      imgPath: "assets/images/fish.png", //
      color: const Color(0xff2EA3F8),
    ),
    ObjectColor(
      imgPath: "assets/images/orange.png", //
      color: const Color(0xffFF8929),
    ),
    ObjectColor(
      imgPath: "assets/images/carrot.png",
      color: const Color(0xffFF8929),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List list = context.watch<CardContent>().getList("colours");
    int answer = Random().nextInt(ques.length);
    List colours = GameController().getlistof4colours(ques[answer].color, list);
    setTtsConfig();
    flutterTts.speak("What color is this?");
    options = [
      GameOptionTile(
        height: 60,
        imgPath: colours[0].imgPath,
        text: colours[0].text,
        textcolor: colours[0].color,
        ontap: () {
          if (colours[0].color == ques[answer].color) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ColourGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak("${colours[0].text} ... What color is this?");
          }
        },
      ),
      GameOptionTile(
        height: 60,
        imgPath: colours[1].imgPath,
        text: colours[1].text,
        textcolor: colours[1].color,
        ontap: () {
          if (colours[1].color == ques[answer].color) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ColourGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak("${colours[1].text} ... What color is this?");
          }
        },
      ),
      GameOptionTile(
        height: 60,
        imgPath: colours[2].imgPath,
        text: colours[2].text,
        textcolor: colours[2].color,
        ontap: () {
          if (colours[2].color == ques[answer].color) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ColourGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak("${colours[2].text} ... What color is this?");
          }
        },
      ),
      GameOptionTile(
        height: 60,
        imgPath: colours[3].imgPath,
        text: colours[3].text,
        textcolor: colours[3].color,
        ontap: () {
          if (colours[3].color == ques[answer].color) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ColourGame()),
            );
            context.read<PointsProvider>().addPoints(10);
          } else {
            flutterTts.speak("${colours[3].text} ... What color is this?");
          }
        },
      ),
    ];
    return PicGame(
      question: "What color is this?",
      onPressed: () {
        flutterTts.speak("What color is this?");
      },
      questionimagepath: ques[answer].imgPath,
      questionimagewidth: 150,
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

class ObjectColor {
  String imgPath;
  Color color;

  ObjectColor({
    required this.color,
    required this.imgPath,
  });
}
