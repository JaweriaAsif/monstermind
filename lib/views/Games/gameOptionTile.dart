import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';

class GameOptionTile extends StatelessWidget {
  const GameOptionTile({
    Key? key,
    required this.imgPath,
    required this.text,
    required this.height,
    required this.ontap,
    this.textcolor,
  }) : super(key: key);

  final String imgPath;
  final double height;
  final String text;
  final String? textcolor;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Card(
          color: const Color(0xffffffff),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height,
                    child: Image(
                      image: FirebaseImage(imgPath),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    text,
                    style: TextStyle(
                      color: textcolor == null
                          ? const Color(0xffF000000)
                          : Color(int.parse(textcolor!)),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GameOptionRow extends StatelessWidget {
  const GameOptionRow({
    Key? key,
    required this.tile1,
    required this.tile2,
  }) : super(key: key);

  final Widget tile1;
  final Widget tile2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [tile1, const SizedBox(width: 10), tile2],
      ),
    );
  }
}

class TextGameOptionTile extends StatelessWidget {
  const TextGameOptionTile({
    Key? key,
    required this.text,
    this.bottomtext,
    required this.textcolor,
    required this.ontap,
    this.isAlphabet = false,
  }) : super(key: key);
  final Color textcolor;
  final String? bottomtext;
  final String text;
  final Function() ontap;
  final bool isAlphabet;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        // child: SizedBox(
        //height: isAlphabet ? 100 : MediaQuery.of(context).size.height * 0.17,
        child: Card(
          color: const Color(0xffffffff),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: Align(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: isAlphabet ? 40 : 20,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: textcolor,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  bottomtext == null
                      ? const SizedBox(height: 4)
                      : Text(
                          bottomtext!,
                          style: TextStyle(
                            color: textcolor,
                            fontSize: 20,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextGameOptionRow extends StatelessWidget {
  const TextGameOptionRow({
    Key? key,
    required this.tile1,
    required this.tile2,
  }) : super(key: key);

  final Widget tile1;
  final Widget tile2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [tile1, const SizedBox(width: 10), tile2],
      ),
    );
  }
}
