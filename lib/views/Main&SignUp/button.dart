import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';

//2EADB5

class Btn extends StatelessWidget {
  const Btn(
      {Key? key,
      required this.text,
      required this.onPress,
      required this.alignment,
      this.icon = false})
      : super(key: key);

  final String text;
  final Alignment alignment;
  final Function onPress;
  final bool icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: const BoxConstraints(minWidth: 150),
        // width: 150,
        height: 50,
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
                style: const TextStyle(
                  fontSize: 27,
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
            backgroundColor: MaterialStateProperty.all<Color>(btnBlue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: btnBlue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
