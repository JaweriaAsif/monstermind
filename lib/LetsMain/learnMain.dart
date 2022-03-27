import 'package:flutter/material.dart';
import 'package:monstermind/LetsMain/letsPageMain.dart';
import 'package:monstermind/LetsMain/optionTile.dart';
import 'package:monstermind/avatar.dart';

class LearnMain extends StatefulWidget {
  const LearnMain({Key? key}) : super(key: key);

  @override
  State<LearnMain> createState() => _LearnMainState();
}

class _LearnMainState extends State<LearnMain> {
  List<OptionTile> options = [];

  @override
  Widget build(BuildContext context) {
    //make list (need context)
    options = [
      //numbers
      OptionTile(
        imgPath: 'assets/images/numbers.png',
        text: 'Numbers',
        color: const Color(0xffD3BDF4),
        ontap: () {
          Navigator.pop(context);
        },
      ),
      // alphabets
      OptionTile(
        imgPath: 'assets/images/alphabets.png',
        text: 'Alphabets',
        color: const Color(0xffD3BDF4),
        ontap: () {},
      ),

      //shapes
      OptionTile(
        imgPath: 'assets/images/shapes.png',
        text: 'Shapes',
        color: const Color(0xffD3BDF4),
        ontap: () {},
      ),
      //colours
      OptionTile(
        imgPath: 'assets/images/colours.png',
        text: 'Colours',
        color: const Color(0xffD3BDF4),
        ontap: () {},
      ),

      //animals
      OptionTile(
        imgPath: 'assets/images/animals.png',
        text: 'Animals',
        color: const Color(0xffD3BDF4),
        ontap: () {},
      ),
      //body parts
      OptionTile(
        imgPath: 'assets/images/body.png',
        text: 'BodyParts',
        color: const Color(0xffD3BDF4),
        ontap: () {},
      ),

      //fruits
      OptionTile(
        imgPath: 'assets/images/fruits.png',
        text: 'Fruits',
        color: const Color(0xffD3BDF4),
        ontap: () {},
      ),
      //veggies
      OptionTile(
        imgPath: 'assets/images/vegetables.png',
        text: 'Vegetabless',
        color: const Color(0xffD3BDF4),
        ontap: () {},
      ),
    ];

    return LetsPageMain(
      imgPath: 'assets/images/remi bg.jpg',
      title: 'Flash Cards',
      titleColour: Color(0xff8D64BF),
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
