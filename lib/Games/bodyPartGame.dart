import 'package:flutter/material.dart';
import 'package:monstermind/Flashcards/cardContent.dart';
import 'package:monstermind/Games/game.dart';
import 'package:monstermind/Games/gameoptionTile.dart';
import 'package:monstermind/tts.dart';

class BodyPartGame extends StatefulWidget {
  const BodyPartGame({Key? key}) : super(key: key);

  @override
  State<BodyPartGame> createState() => _BodyPartGameState();
}

class _BodyPartGameState extends State<BodyPartGame> {
  List<GameOptionTile> options = [];
  List list = CardContent(from: "body").list;

  @override
  Widget build(BuildContext context) {
    List bodyparts = CardContent().getlistof4(list);
    int answer = CardContent().getquest(bodyparts);

    setTtsConfig();
    flutterTts.speak(
        "Select the ${bodyparts[answer].text}");
    options = [
      GameOptionTile(
        height: 110,
        imgPath: bodyparts[0].imgPath,
        text: bodyparts[0].text,
        ontap: () {
          if (0 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BodyPartGame()),
            );
          }
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: bodyparts[1].imgPath,
        text: bodyparts[1].text,
        ontap: () {
          if (1 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BodyPartGame()),
            );
          }
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: bodyparts[2].imgPath,
        text: bodyparts[2].text,
        ontap: () {
          if (2 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BodyPartGame()),
            );
          }
        },
      ),
      GameOptionTile(
        height: 110,
        imgPath: bodyparts[3].imgPath,
        text: bodyparts[3].text,
        ontap: () {
          if (3 == answer) {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BodyPartGame()),
            );
          }
        },
      ),
    ];
    return Game(
      question: "Select the body part from the audio",
      onPressed: (){
         flutterTts.speak(
        "Select the ${bodyparts[answer].text}");
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
