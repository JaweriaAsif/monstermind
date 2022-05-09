import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/views/Games/alphabetDraw.dart';
import 'package:monstermind/views/Games/comparisonGame.dart';
import 'package:monstermind/views/Games/alphabetGame.dart';
import 'package:monstermind/views/Games/animalGame.dart';
import 'package:monstermind/views/Games/bodyPartGame.dart';
import 'package:monstermind/views/Games/colourGame.dart';
import 'package:monstermind/views/Games/fruitsGame.dart';
import 'package:monstermind/views/Games/numberGame.dart';
import 'package:monstermind/views/Games/numbersDraw.dart';
import 'package:monstermind/views/Games/shapeGame.dart';
import 'package:monstermind/views/LetsMain/letsPageMain.dart';
import 'package:monstermind/views/LetsMain/optionTile.dart';

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
        color: yellow,
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
        color: yellow,
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
        color: yellow,
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
        color: yellow,
        ontap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ColourGame()));
        },
      ),

      //animals
      OptionTile(
        imgPath: 'assets/images/animals.png',
        text: 'Animals',
        color: yellow,
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AnimalGame()),
          );
        },
      ),
      //body parts
      OptionTile(
        imgPath: 'assets/images/body.png',
        text: 'Body Parts',
        color: yellow,
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
        color: yellow,
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
        color: yellow,
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ComparisonGame()),
          );
        },
      ),

      //drawing
      OptionTile(
        imgPath: 'assets/images/abcdraw.png',
        text: 'Draw Letters',
        color: yellow,
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const AlphabetDrawingGame()),
          );
        },
      ),

      //numbers
      OptionTile(
        imgPath: 'assets/images/123draw.png',
        text: 'Draw Numbers',
        color: yellow,
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NumberDrawingGame()),
          );
        },
      ),
    ];

    return LetsPageMain(
      audioPath: "assets/audios/m3.mp3",
      bgImgPath: 'assets/images/aloobg color.jpg',
      monsterImgPath: 'assets/images/aloohq.png',
      title: 'Games',
      titleColour: darkYellow,
      list: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => OptionRow(
          tile1: options[index * 2],
          tile2: options[index * 2 + 1],
        ),
        itemCount: 5,
      ),
    );
  }
}
