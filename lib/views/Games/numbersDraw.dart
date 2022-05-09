import 'package:flutter/material.dart';
import 'package:learning_digital_ink_recognition/learning_digital_ink_recognition.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/digitalInk.dart';
import 'package:monstermind/models/digitalInkPainter.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/controllers/pointsProvider.dart';
import 'package:monstermind/controllers/tts.dart';
import 'package:monstermind/views/Games/drawingGame.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:monstermind/views/Main&SignUp/button.dart';
import 'package:provider/provider.dart';

// List numbers = [];
late int ques; //can change to 20 later

class NumberDrawingGame extends StatefulWidget {
  const NumberDrawingGame({Key? key}) : super(key: key);

  @override
  State<NumberDrawingGame> createState() => Number_DrawingGameState();
}

class Number_DrawingGameState extends State<NumberDrawingGame> {
  @override
  Widget build(BuildContext context) {
    ques = GameController().getnum(10);
    return Game(
        question: "Draw the number from the audio",
        list: DrawingGame(
          ques: ques.toString(),
          speak: "Draw the number $ques",
          isAlphabet: false,
        ),
        onPressed: () {
          flutterTts.speak("Draw the number $ques");
        });
  }
}
