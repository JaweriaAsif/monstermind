import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/games/questions.dart';
import 'package:monstermind/views/Games/compGame.dart';
import 'package:monstermind/views/loadingCircle.dart';
import 'package:provider/provider.dart';

List ques = [];
bool isLoading = false;

List<String> size = ["largest", "smallest"];

class ComparisonGame extends StatefulWidget {
  const ComparisonGame({Key? key}) : super(key: key);

  @override
  State<ComparisonGame> createState() => _ComparisonGameState();
}

class _ComparisonGameState extends State<ComparisonGame> {
  @override
  Widget build(BuildContext context) {
    isLoading = true;
    ques = context.watch<Questions>().compQuest;

    if (ques.isNotEmpty) {
      isLoading = false;
    }

    if (isLoading) {
      return Scaffold(
        backgroundColor: bgYellow,
        body: Center(
          child: LoadingCircle(color: darkYellow),
        ),
      );
    }

    return CompGame(
      question: size[Random().nextInt(size.length)],
      questionimagepath: ques[Random().nextInt(ques.length)].imgPath,
    );
  }
}
