import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/views/Games/compGame.dart';

List<String> objectspath = [
  'assets/images/elephant.png',
  'assets/images/whale.png',
  'assets/images/balloon.png',
  'assets/images/ball.png',
  'assets/images/cow.png',
  'assets/images/cow.png',
  'assets/images/strawberry.png',
  'assets/images/orange.png',
];
List<String> size = ["largest", "smallest"];

class ComparisonGame extends StatefulWidget {
  const ComparisonGame({Key? key}) : super(key: key);

  @override
  State<ComparisonGame> createState() => _ComparisonGameState();
}

class _ComparisonGameState extends State<ComparisonGame> {
  @override
  Widget build(BuildContext context) {
    return CompGame(
      question: size[Random().nextInt(size.length)],
      questionimagepath: objectspath[Random().nextInt(objectspath.length)],
    );
  }
}
