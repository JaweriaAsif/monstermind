import 'dart:math';

import 'package:flutter/material.dart';

class CardContent {
  List _list = [];
  String? from = "";

  CardContent({this.from});

  List get list {
    if (from == "alphabets") {
      _list = alphabetList();
    } else if (from == "numbers") {
      _list = numbersList();
    } else if (from == "shapes") {
      _list = shapesList();
    } else if (from == "colours") {
      _list = coloursList();
    } else if (from == "body") {
      _list = bodyPartsList();
    } else if (from == "animals") {
      _list = animalsList();
    } else if (from == "fruits") {
      _list = fruitsList();
    } else if (from == "veggies") {
      _list = veggiesList();
    }
    return _list;
  }

  //function: create alphabet list
  List alphabetList() {
    List l = [];
    for (var i = 0; i < 26; i++) {
      String s = String.fromCharCode(i + 65) + String.fromCharCode(i + 97);
      l.add(s);
    }
    return l;
  }

  //function: create numbers list
  List<TextPicCard> numbersList() {
    return [
      TextPicCard(
        topText: "1",
        bottomText: "One",
        imgPath: 'assets/images/apple.png',
      ),
      TextPicCard(
        topText: "2",
        bottomText: "Two",
        imgPath: 'assets/images/2 ducks.png',
      ),
      TextPicCard(
        topText: "5",
        bottomText: "Five",
        imgPath: 'assets/images/5 fish.png',
      ),
      TextPicCard(
        topText: "7",
        bottomText: "Seven",
        imgPath: 'assets/images/7 trees.png',
      ),
      TextPicCard(
        topText: "9",
        bottomText: "Nine",
        imgPath: 'assets/images/9 ants.png',
      ),
    ];
  }

  //function: create shapes list
  List<PicTextCard> shapesList() {
    return [
      PicTextCard(
        text: "Circle",
        imgPath: "assets/images/circle.png",
        color: const Color(0xffF11162),
      ),
      PicTextCard(
        text: "Square",
        imgPath: "assets/images/square.png",
        color: const Color(0xff5CD978),
      ),
      PicTextCard(
        text: "Triangle",
        imgPath: "assets/images/triangle.png",
        color: const Color(0xff2EA3F8),
      ),
      PicTextCard(
        text: "Star",
        imgPath: "assets/images/star.png",
        color: const Color(0xffD9825C),
      ),
      PicTextCard(
        text: "Rectangle",
        imgPath: "assets/images/rectangle.png",
        color: const Color(0xffC915D8),
      ),
    ];
  }

  //function: create animals list
  List<PicTextCard> coloursList() {
    return [
      PicTextCard(
        text: "Red",
        imgPath: "assets/images/red.png",
        color: const Color(0xffF11162),
      ),
      PicTextCard(
        text: "Green",
        imgPath: "assets/images/green.png",
        color: const Color(0xff5CD978),
      ),
      PicTextCard(
        text: "Blue",
        imgPath: "assets/images/blue.png",
        color: const Color(0xff2EA3F8),
      ),
      PicTextCard(
        text: "Yellow",
        imgPath: "assets/images/yellow.png",
        color: const Color(0xffF9DF00),
      ),
      PicTextCard(
        text: "Purple",
        imgPath: "assets/images/purple.png",
        color: const Color(0xffC915D8),
      ),
    ];
  }

  //function: create animals list
  List<PicTextCard> animalsList() {
    return [
      PicTextCard(
        text: "Elephant",
        imgPath: "assets/images/elephant.png",
      ),
      PicTextCard(
        text: "Whale",
        imgPath: "assets/images/whale.png",
      ),
      PicTextCard(
        text: "Duck",
        imgPath: "assets/images/duck.png",
      ),
      PicTextCard(
        text: "Giraffe",
        imgPath: "assets/images/giraffe.png",
      ),
      PicTextCard(
        text: "Octopus",
        imgPath: "assets/images/octopus.png",
      ),
      PicTextCard(
        text: "Cow",
        imgPath: "assets/images/cow.png",
      ),
    ];
  }

  //function: create body parts list
  List<PicTextCard> bodyPartsList() {
    return [
      PicTextCard(
        text: "Nose",
        imgPath: "assets/images/nose.png",
      ),
      PicTextCard(
        text: "Foot",
        imgPath: "assets/images/foot.png",
      ),
      PicTextCard(
        text: "Ear",
        imgPath: "assets/images/ear.png",
      ),
      PicTextCard(
        text: "Arm",
        imgPath: "assets/images/arm.png",
      ),
      PicTextCard(
        text: "Tongue",
        imgPath: "assets/images/tongue.png",
      ),
    ];
  }

  //function: create body parts list
  List<PicTextCard> fruitsList() {
    return [
      PicTextCard(
        text: "Watermelon",
        imgPath: "assets/images/watermelon.png",
      ),
      PicTextCard(
        text: "Strawberry",
        imgPath: "assets/images/strawberry.png",
      ),
      PicTextCard(
        text: "Apple",
        imgPath: "assets/images/apple.png",
      ),
      PicTextCard(
        text: "Orange",
        imgPath: "assets/images/orange.png",
      ),
      PicTextCard(
        text: "Grapes",
        imgPath: "assets/images/grapes.png",
      ),
    ];
  }

  //function: create vegetables list
  List<PicTextCard> veggiesList() {
    return [
      PicTextCard(
        text: "Potato",
        imgPath: "assets/images/potato.png",
      ),
      PicTextCard(
        text: "Carrot",
        imgPath: "assets/images/carrot.png",
      ),
      PicTextCard(
        text: "Eggplant",
        imgPath: "assets/images/eggplant.png",
      ),
      PicTextCard(
        text: "Broccoli",
        imgPath: "assets/images/broccoli.png",
      ),
      PicTextCard(
        text: "Radish",
        imgPath: "assets/images/radish.png",
      ),
    ];
  }

  int getquest(List list) {
    return Random().nextInt(list.length);
  }

  List getlistof4(List list) {
    List l = [];
    for (var i = 0; i < 4; i++) {
      int ran = Random().nextInt(list.length);
      l.add(list[ran]);
      list.removeAt(ran);
    }
    return l;
  }
}

class PicTextCard {
  String imgPath;
  String text;
  Color color;

  PicTextCard({
    required this.text,
    required this.imgPath,
    this.color = Colors.black,
  });
}

class TextPicCard {
  String imgPath;
  String topText;
  String bottomText;

  TextPicCard({
    required this.topText,
    required this.bottomText,
    required this.imgPath,
  });
}
