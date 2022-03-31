import 'package:flutter/material.dart';

class GameOptionTile extends StatelessWidget {
  const GameOptionTile({
    Key? key,
    required this.imgPath,
    required this.text,
    // required this.color,
    required this.ontap,
  }) : super(key: key);

  final String imgPath;
  // final Color color;
  final String text;
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
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 110,
                    child: Image(
                      image: AssetImage(imgPath),
                    ),
                  ),
                  const SizedBox(height: 3),
                  text == ""
                      ? SizedBox()
                      : Text(
                          text,
                          style: const TextStyle(
                            color: const Color(0xffF000000),
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

class GameOptionRow extends StatelessWidget {
  const GameOptionRow({
    Key? key,
    required this.tile1,
    required this.tile2,
  }) : super(key: key);

  final GameOptionTile tile1;
  final GameOptionTile tile2;

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
