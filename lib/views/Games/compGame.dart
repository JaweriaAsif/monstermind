import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:monstermind/controllers/games/comparison.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/views/Games/comparisonGame.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:monstermind/views/avatar.dart';
import 'package:provider/provider.dart';

import '../tts.dart';

late bool isCorrect;

class CompGame extends StatefulWidget {
  const CompGame({
    Key? key,
    required this.question,
    required this.questionimagepath,
  }) : super(key: key);
  final String questionimagepath;
  final String question;

  @override
  State<CompGame> createState() => _CompGameState();
}

class _CompGameState extends State<CompGame> {
  @override
  Widget build(BuildContext context) {
    List<double> heights = Comparison().shuffleHeights();

    setTtsConfig();
    flutterTts.speak("Select the ${widget.question}.");

    return Scaffold(
      backgroundColor: const Color(0xffFCE79A),
      body: Column(
        children: [
          AvatarAppbar(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height / 3) * 1,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0.8, -0.5),
                  child: IconButton(
                    onPressed: () {
                      flutterTts.speak("Select the ${widget.question}.");
                    },
                    icon: const Icon(Icons.volume_up_rounded),
                    color: Colors.white,
                    iconSize: 50,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 3) * 2.28,
                  child: Stack(children: [
                    const Image(
                      image: AssetImage('assets/images/speechbubble.png'),
                    ),
                    Column(children: [
                      const SizedBox(height: 74),
                      Row(
                        children: [
                          const SizedBox(width: 36),
                          SizedBox(
                            width: 235,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Select the ${widget.question}.",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: const Color(0xffF1B111),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ]),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 150,
                    child: Image(
                      image: AssetImage('assets/images/aloo.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                CompOption(
                  question: widget.question,
                  questionimagepath: widget.questionimagepath,
                  xAlign: 0.61,
                  height: heights[0],
                ),
                CompOption(
                  question: widget.question,
                  questionimagepath: widget.questionimagepath,
                  xAlign: -0.8,
                  height: heights[1],
                ),
                CompOption(
                  question: widget.question,
                  questionimagepath: widget.questionimagepath,
                  xAlign: 0.8,
                  height: heights[2],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class CompOption extends StatelessWidget {
  CompOption({
    Key? key,
    required this.question,
    required this.questionimagepath,
    required this.xAlign,
    required this.height,
  }) : super(key: key);

  final double xAlign;
  final String question;
  final String questionimagepath;
  final double height;

  @override
  Widget build(BuildContext context) {
    // double height;

    return Align(
      alignment: Alignment(xAlign, 0),
      child: InkWell(
        child: SizedBox(
          height: height,
          child: Image(
            image: FirebaseImage(questionimagepath),
            fit: BoxFit.fill,
          ),
        ),
        onTap: () {
          isCorrect = GameController().actionOnAns(
            ques: Comparison().quest(question).toString(),
            ans: height.toString(),
            context: context,
            navTo: const ComparisonGame(),
            speak: "Select the $question",
          );
          if (isCorrect) {
            context.read<PointsProvider>().addPoints(10);
          }
        },
      ),
    );
  }
}
