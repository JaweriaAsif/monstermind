import 'package:flutter/material.dart';

class MonsterBg extends StatefulWidget {
  const MonsterBg(
      {Key? key, required this.bgImgPath, required this.monsterImgPath})
      : super(key: key);

  final String monsterImgPath;
  final String bgImgPath;

  @override
  State<MonsterBg> createState() => _MonsterBgState();
}

class _MonsterBgState extends State<MonsterBg> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image(
              image: AssetImage(widget.bgImgPath),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage(widget.monsterImgPath),
              fit: BoxFit.fill,
            ),
          ],
        ));
  }
}
