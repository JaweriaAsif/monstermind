import 'package:flutter/material.dart';

//2EADB5

class Btn extends StatelessWidget {
  const Btn({
    Key? key,
    required this.text,
    required this.onPress,
    required this.alignment,
  }) : super(key: key);

  final String text;
  final Alignment alignment;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: 150,
        height: 50,
        child: ElevatedButton(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 27,
            ),
          ),
          onPressed: () {
            onPress();
          },

          //button style
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xff2EADB5)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: const BorderSide(color: Color(0xff2EADB5)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
