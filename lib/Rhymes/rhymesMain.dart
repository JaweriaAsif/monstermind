import 'package:flutter/material.dart';
import 'package:monstermind/LetsMain/letsPageMain.dart';
import 'package:monstermind/Rhymes/rhymeTile.dart';
import 'package:monstermind/Rhymes/rhymes.dart';
import 'package:monstermind/Rhymes/ryhmesProvider.dart';
import 'package:provider/provider.dart';

class RhymesMain extends StatefulWidget {
  const RhymesMain({Key? key}) : super(key: key);

  @override
  State<RhymesMain> createState() => _RhymesMainState();
}

class _RhymesMainState extends State<RhymesMain> {
  @override
  Widget build(BuildContext context) {
    List<Rhymes> rhymes = context.watch<RhymesProvider>().rhymes;

    return LetsPageMain(
      imgPath: 'assets/images/crab bg.jpg',
      title: 'Rhymes',
      titleColour: const Color(0xffEE412A),
      list: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemBuilder: (context, index) => RhymeTile(rhyme: rhymes[index]),
          itemCount: rhymes.length,
        ),
      ),
    );
  }
}
