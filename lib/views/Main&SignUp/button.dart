import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';

//2EADB5

class Btn extends StatelessWidget {
  const Btn({
    Key? key,
    required this.text,
    required this.onPress,
    required this.alignment,
    this.icon = false,
    this.height = 50,
    this.font = 27,
    this.color = const Color(0xff2EADB5),
    this.minWidth = 150,
  }) : super(key: key);

  final String text;
  final Alignment alignment;
  final Function onPress;
  final bool icon;
  final double height;
  final double font;
  final Color color;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(minWidth: minWidth),
        // width: 150,
        height: height,
        child: ElevatedButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //set Google icon
              if (icon) ...[
                const Padding(
                  padding: EdgeInsets.only(right: 10, left: 0),
                  child: Image(
                    image: AssetImage("assets/images/googleCircle.png"),
                    width: 40,
                  ),
                ),
              ],
              Text(
                text,
                style: TextStyle(
                  fontSize: font,
                ),
              ),
            ],
          ),
          onPressed: () {
            onPress();
          },

          //button style
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
