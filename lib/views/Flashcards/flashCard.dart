import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/models/PicTextCard.dart';
import 'package:monstermind/models/TextPicCard.dart';

import '../tts.dart';
import 'dart:convert';

class FlashCard extends StatefulWidget {
  FlashCard({Key? key, required this.content, required this.from})
      : super(
          key: key,
        ) {
    // flutterTts.setLanguage('en');
  }

  final content;
  final String from;

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  @override
  Widget build(BuildContext context) {
    setTtsConfig();
    speak();

    return SizedBox(
      width: MediaQuery.of(context).size.width - 80,
      height: 510,
      child: Card(
        child: Stack(
          children: [
            //audio button
            Align(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                child: IconButton(
                  onPressed: () {
                    speak();
                  },
                  icon: const Icon(
                    Icons.volume_up_rounded,
                    size: 40,
                    color: Color(0xff946DE0),
                  ),
                ),
              ),
              alignment: Alignment.topRight,
            ),

            //card content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //space on top of num card
                  if (widget.from == "numbers") ...[
                    const SizedBox(height: 20),
                  ],
                  //alphabet card content
                  if (widget.from == "alphabets" ||
                      widget.from == "numbers") ...[
                    Text(
                      widget.from == "alphabets"
                          ? widget.content
                          : (widget.content as TextPicCard).topText.toString(),
                      style: TextStyle(
                          fontSize: 110,
                          fontWeight: FontWeight.w900,
                          color: colors[Random().nextInt(colors.length)]),
                    ),
                  ],

                  //numbers card content
                  if (widget.from == "numbers") ...[
                    Text(
                      (widget.content as TextPicCard).bottomText,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 30),
                    Image(
                      height: 110,
                      image: FirebaseImage(
                          (widget.content as TextPicCard).imgPath),
                      fit: BoxFit.fill,
                    ),
                  ],

                  //other cards
                  if (widget.from != "alphabets" &&
                      widget.from != "numbers") ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Container(
                        constraints: const BoxConstraints(
                            maxWidth: 200, maxHeight: 200, minHeight: 120),
                        child: Image(
                          image: FirebaseImage(
                              (widget.content as PicTextCard).imgPath),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      (widget.content as PicTextCard).text,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Color(
                            int.parse((widget.content as PicTextCard).color)),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),

        //cosmetics
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: purple,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  void speak() {
    String toSpeak = "";
    if (widget.from == "numbers") {
      toSpeak = (widget.content as TextPicCard).bottomText;
    } else if (widget.from == "alphabets") {
      toSpeak = (widget.content as String).substring(0, 1);
    } else {
      toSpeak = (widget.content as PicTextCard).text;
    }

    flutterTts.speak(toSpeak);
  }
}
