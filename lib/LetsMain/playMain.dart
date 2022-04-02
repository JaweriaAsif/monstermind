import 'package:flutter/material.dart';
import 'package:monstermind/Games/comparisonGame.dart';
import 'package:monstermind/Games/alphabetGame.dart';
import 'package:monstermind/Games/animalGame.dart';
import 'package:monstermind/Games/bodyPartGame.dart';
import 'package:monstermind/Games/colourGame.dart';
import 'package:monstermind/Games/fruitsGame.dart';
import 'package:monstermind/Games/numberGame.dart';
import 'package:monstermind/Games/shapeGame.dart';
import 'package:monstermind/LetsMain/letsPageMain.dart';
import 'package:monstermind/LetsMain/optionTile.dart';

class PlayMain extends StatefulWidget {
  const PlayMain({Key? key}) : super(key: key);

  @override
  State<PlayMain> createState() => _PlayMainState();
}

class _PlayMainState extends State<PlayMain> {
  List<OptionTile> options = [];

  @override
  Widget build(BuildContext context) {
    //make list (need context)
    options = [
      //numbers
      OptionTile(
        imgPath: 'assets/images/numbers.png',
        text: 'Numbers',
        color: const Color(0xffFCE79A),
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NumberGame()),
          );
        },
      ),
      // alphabets
      OptionTile(
        imgPath: 'assets/images/alphabets.png',
        text: 'Alphabets',
        color: const Color(0xffFCE79A),
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AlphabetGame()),
          );
        },
      ),

      //shapes
      OptionTile(
        imgPath: 'assets/images/shapes.png',
        text: 'Shapes',
        color: const Color(0xffFCE79A),
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ShapeGame()),
          );
        },
      ),
      //colours
      OptionTile(
        imgPath: 'assets/images/colours.png',
        text: 'Colours',
        color: const Color(0xffFCE79A),
        ontap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ColourGame()));
        },
      ),

      //animals
      OptionTile(
        imgPath: 'assets/images/animals.png',
        text: 'Animals',
        color: const Color(0xffFCE79A),
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AnimalGame()),
          );
        },
      ),
      //body parts
      OptionTile(
        imgPath: 'assets/images/body.png',
        text: 'BodyParts',
        color: const Color(0xffFCE79A),
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BodyPartGame()),
          );
        },
      ),

      //fruits
      OptionTile(
        imgPath: 'assets/images/fruits.png',
        text: 'Fruits',
        color: const Color(0xffFCE79A),
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FruitsGame()),
          );
        },
      ),

      //comparing
      OptionTile(
        imgPath: 'assets/images/compare.png',
        text: 'Comparisons',
        color: const Color(0xffFCE79A),
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ComparisonGame()),
          );
        },
      ),
    ];

    return LetsPageMain(
      imgPath: 'assets/images/aloo bg.jpg',
      title: 'Games',
      titleColour: const Color(0xffF1B111),
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => OptionRow(
          tile1: options[index * 2],
          tile2: options[index * 2 + 1],
        ),
        itemCount: 4,
      ),
    );
  }
}
