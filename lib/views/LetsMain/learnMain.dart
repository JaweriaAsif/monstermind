import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/views/Flashcards/cardPage.dart';
import 'package:monstermind/views/LetsMain/letsPageMain.dart';
import 'package:monstermind/views/LetsMain/optionTile.dart';
import 'package:monstermind/views/Points&Profile/avatar.dart';

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
        color: bgPurple,
        ontap: () => toCardMain(context, "numbers"),
      ),
      // alphabets
      OptionTile(
        imgPath: 'assets/images/alphabets.png',
        text: 'Alphabets',
        color: bgPurple,
        ontap: () => toCardMain(context, "alphabets"),
      ),

      //shapes
      OptionTile(
        imgPath: 'assets/images/shapes.png',
        text: 'Shapes',
        color: bgPurple,
        ontap: () => toCardMain(context, "shapes"),
      ),
      //colours
      OptionTile(
        imgPath: 'assets/images/colours.png',
        text: 'Colours',
        color: bgPurple,
        ontap: () => toCardMain(context, "colours"),
      ),

      //animals
      OptionTile(
        imgPath: 'assets/images/animals.png',
        text: 'Animals',
        color: bgPurple,
        ontap: () => toCardMain(context, "animals"),
      ),
      //body parts
      OptionTile(
        imgPath: 'assets/images/body.png',
        text: 'Body Parts',
        color: bgPurple,
        ontap: () => toCardMain(context, "body"),
      ),

      //fruits
      OptionTile(
        imgPath: 'assets/images/fruits.png',
        text: 'Fruits',
        color: bgPurple,
        ontap: () => toCardMain(context, "fruits"),
      ),
      //veggies
      OptionTile(
        imgPath: 'assets/images/vegetables.png',
        text: 'Vegetables',
        color: bgPurple,
        ontap: () => toCardMain(context, "veggies"),
      ),
    ];

    return LetsPageMain(
      audioPath: "assets/audios/m1.mp3",
      bgImgPath: 'assets/images/remibg color.png',
      monsterImgPath: 'assets/images/remihq.png',
      title: 'Flash Cards',
      titleColour: darkPurple,
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

  void toCardMain(BuildContext context, String from) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CardPage(from: from)),
    );
  }
}
