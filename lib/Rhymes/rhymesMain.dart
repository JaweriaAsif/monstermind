import 'package:flutter/material.dart';
import 'package:monstermind/LetsMain/letsPageMain.dart';

class RhymesMain extends StatefulWidget {
  const RhymesMain({Key? key}) : super(key: key);

  @override
  State<RhymesMain> createState() => _RhymesMainState();
}

class _RhymesMainState extends State<RhymesMain> {
  @override
  Widget build(BuildContext context) {
    return LetsPageMain(
      imgPath: 'assets/images/crab bg.jpg',
      title: 'Rhymes',
      titleColour: const Color(0xffEE412A),
      list: Container(),
    );
  }
}
