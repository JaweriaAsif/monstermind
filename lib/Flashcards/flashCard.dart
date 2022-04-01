import 'package:flutter/material.dart';
import 'dart:math';

import 'package:monstermind/Flashcards/cardContent.dart';

class FlashCard extends StatelessWidget {
  const FlashCard({Key? key, required this.content, required this.from})
      : super(key: key);

  final content;
  final String from;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = const [
      Color(0xff5CD978),
      Color(0xffD9825C),
      Color(0xff28AAF2),
      Color(0xffE445B8),
      Color(0xffF11162),
      Color(0xffFF3C3C),
      Color(0xffC915D8),
    ];

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
                  onPressed: () {},
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
                  if (from == "numbers") ...[
                    const SizedBox(height: 20),
                  ],
                  //alphabet card content
                  if (from == "alphabets" || from == "numbers") ...[
                    Text(
                      from == "alphabets"
                          ? content
                          : (content as TextPicCard).topText,
                      style: TextStyle(
                          fontSize: 110,
                          fontWeight: FontWeight.w900,
                          color: colors[Random().nextInt(colors.length)]),
                    ),
                  ],

                  //numbers card content
                  if (from == "numbers") ...[
                    Text(
                      (content as TextPicCard).bottomText,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 30),
                    Image(
                      height: 110,
                      image: AssetImage((content as TextPicCard).imgPath),
                      fit: BoxFit.fill,
                    ),
                  ],

                  //other cards
                  if (from != "alphabets" && from != "numbers") ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Container(
                        constraints: const BoxConstraints(
                            maxWidth: 200, maxHeight: 200, minHeight: 120),
                        child: Image(
                          image: AssetImage((content as PicTextCard).imgPath),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      (content as PicTextCard).text,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: (content as PicTextCard).color,
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
          side: const BorderSide(
            color: Color(0xff946DDF),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
