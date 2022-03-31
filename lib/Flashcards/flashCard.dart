import 'package:flutter/material.dart';
import 'dart:math';

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
      height: 500,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //alphabet card
            if (from == "alphabets") ...[
              Text(
                content,
                style: TextStyle(
                    fontSize: 110,
                    fontWeight: FontWeight.w900,
                    color: colors[Random().nextInt(colors.length)]),
              ),
            ]
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
