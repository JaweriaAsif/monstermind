import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    Key? key,
    required this.imgPath,
    required this.text,
    required this.color,
    required this.ontap,
  }) : super(key: key);

  final String imgPath;
  final Color color;
  final String text;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Card(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: Image(
                      image: AssetImage(imgPath),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OptionRow extends StatelessWidget {
  const OptionRow({
    Key? key,
    required this.tile1,
    required this.tile2,
  }) : super(key: key);

  final OptionTile tile1;
  final OptionTile tile2;

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
