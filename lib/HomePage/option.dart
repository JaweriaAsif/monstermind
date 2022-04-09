import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class Option extends StatelessWidget {
  Option({
    Key? key,
    required this.path,
    required this.color,
    required this.text,
    required this.ontap,
    this.audioPath = "",
  }) : super(key: key);

  final String path;
  final String text;
  final Color color;
  final Function() ontap;
  final String audioPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //monster
          Spring.bubbleButton(
            child: SizedBox(
              height: 130,
              width: 130,
              child: Image(
                image: AssetImage(path),
                fit: BoxFit.fill,
              ),
            ),
            onTap: () {},
            animDuration: Duration(seconds: 1), //def=500m mil
            bubbleStart: .8, //def=0.0
            bubbleEnd: .9, //def=1.1
            animStatus: (AnimStatus status) {
              print(status);
            },
            curve: Curves.linear, //Curves.elasticOut
            delay: Duration(milliseconds: 0), //def=0
          ),

          const SizedBox(
            width: 5,
          ),

          //card
          InkWell(
            child: SizedBox(
              width: 180,
              height: 110,
              child: Card(
                color: Colors.white,
                child: Align(
                  child: Text(
                    "Let's $text!",
                    style: TextStyle(
                        color: color,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            ),

            //todo
            onTap: ontap,
          ),
        ],
      ),
    );
  }
}
