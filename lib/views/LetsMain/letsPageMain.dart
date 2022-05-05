import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/views/LetsMain/monsterBg.dart';
import 'package:monstermind/views/Points&Profile/avatar.dart';
import 'package:monstermind/views/loadingCircle.dart';

class LetsPageMain extends StatelessWidget {
  const LetsPageMain({
    Key? key,
    required this.bgImgPath,
    required this.audioPath,
    required this.monsterImgPath,
    required this.title,
    required this.titleColour,
    required this.list,
  }) : super(key: key);

  final String bgImgPath;
  final String audioPath;
  final String monsterImgPath;
  final String title;
  final Color titleColour;
  final Widget list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AvatarAppbar(),
          MonsterBg(
            bgImgPath: bgImgPath,
            monsterImgPath: monsterImgPath,
            audioPath: audioPath,
          ),
          Text(
            title,
            style: TextStyle(
              color: titleColour,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(child: list),
        ],
      ),
    );
  }
}
