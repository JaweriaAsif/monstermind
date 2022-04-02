import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/Games/ComparisonGame.dart';
// import 'package:monstermind/Games/comparisonGame.dart';
import 'package:monstermind/avatar.dart';

class CompGame extends StatefulWidget {
  CompGame({
    Key? key,
    required this.question,
    required this.questionimagepath,
    // required this.questionimagewidth,
    //required this.list,
  }) : super(key: key);
  final String questionimagepath;
  //final double questionimagewidth;
  final String question;

  @override
  State<CompGame> createState() => _CompGameState();
}

class _CompGameState extends State<CompGame> {
  final List<double> heights = [110, 60, 220];

  late double? height1;

  late double? height2;

  late double? height3;

  @override
  Widget build(BuildContext context) {
    double randomheight() {
      int ran = Random().nextInt(heights.length);
      double h = heights[ran];
      heights.removeAt(ran);
      return h;
    }

    double quest(String question) {
      if (question == "largest") {
        return 220;
      }
      return 60;
    }

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
                      //add audio
                    },
                    icon: const Icon(Icons.volume_up_rounded),
                    color: Colors.white,
                    iconSize: 50,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 3) * 2.28,
                  // height: (MediaQuery.of(context).size.height / 3) * 0.8,
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
                                "Select the ${widget.question} object",
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
                Align(
                  alignment: const Alignment(0.61, 0),
                  child: InkWell(
                    child: SizedBox(
                      height: true ? height1 = randomheight() : null,
                      //width: questionimagewidth,
                      child: Image(
                        image: AssetImage(widget.questionimagepath),
                        fit: BoxFit.fill,
                      ),
                    ),
                    onTap: () {
                      if (quest(widget.question) == height1) {
                        // height1 = null;
                        // correctheight = null;
                        // setState(() {});
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ComparisonGame()),
                        );
                      }
                    },
                  ),
                ),
                Align(
                  alignment: const Alignment(-0.8, 0),
                  child: InkWell(
                    child: SizedBox(
                      height: true ? height2 = randomheight() : null,
                      //width: questionimagewidth,
                      child: Image(
                        image: AssetImage(widget.questionimagepath),
                        fit: BoxFit.fill,
                      ),
                    ),
                    onTap: () {
                      if (quest(widget.question) == height2) {
                        //height2 = null;
                        // correctheight = null;
                        // setState(() {});
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ComparisonGame()),
                        );
                      }
                    },
                  ),
                ),
                Align(
                  alignment: const Alignment(0.8, 0),
                  child: InkWell(
                    child: SizedBox(
                      height: true ? height3 = randomheight() : null,
                      //width: questionimagewidth,
                      child: Image(
                        image: AssetImage(widget.questionimagepath),
                        fit: BoxFit.fill,
                      ),
                    ),
                    onTap: () {
                      if (quest(widget.question) == height3) {
                        // setState(() {});
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ComparisonGame()),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Expanded(child: list),
        ],
      ),
    );
  }
}
