import 'package:flutter/material.dart';
import 'package:monstermind/LetsMain/Games/alphabetGame.dart';
import 'package:monstermind/LetsMain/letsPageMain.dart';
import 'package:monstermind/LetsMain/optionTile.dart';
import 'package:monstermind/avatar.dart';

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
        color: const Color(0xffF8DA6B),
        ontap: () {
          Navigator.pop(context);
        },
      ),
      // alphabets
      OptionTile(
        imgPath: 'assets/images/alphabets.png',
        text: 'Alphabets',
        color: const Color(0xffF8DA6B),
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
        color: const Color(0xffF8DA6B),
        ontap: () {},
      ),
      //colours
      OptionTile(
        imgPath: 'assets/images/colours.png',
        text: 'Colours',
        color: const Color(0xffF8DA6B),
        ontap: () {},
      ),

      //animals
      OptionTile(
        imgPath: 'assets/images/animals.png',
        text: 'Animals',
        color: const Color(0xffF8DA6B),
        ontap: () {},
      ),
      //body parts
      OptionTile(
        imgPath: 'assets/images/body.png',
        text: 'BodyParts',
        color: const Color(0xffF8DA6B),
        ontap: () {},
      ),

      //fruits
      OptionTile(
        imgPath: 'assets/images/fruits.png',
        text: 'Fruits',
        color: const Color(0xffF8DA6B),
        ontap: () {},
      ),

      //comparing
      OptionTile(
        imgPath: 'assets/images/compare.png',
        text: 'Comparisons',
        color: const Color(0xffF8DA6B),
        ontap: () {},
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
