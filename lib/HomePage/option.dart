import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  Option({
    Key? key,
    required this.path,
    required this.color,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  final String path;
  final String text;
  final Color color;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 130,
            width: 130,
            child: Image(
              image: AssetImage(path),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
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
