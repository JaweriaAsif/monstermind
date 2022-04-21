import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monstermind/models/PicTextCard.dart';
import 'package:monstermind/models/TextPicCard.dart';

class CardContent extends ChangeNotifier {
  List _list = [];
  String? from = "";

  // CardContent() {
  //   // getTasks();
  //   notifyListeners();
  // }

  CardContent({this.from}) {
    getLists();
    notifyListeners();
  }

  List get list => _list;

  List getList(String from) {
    if (from == "alphabets") {
      _list = alphabetList();
      notifyListeners();
    } else if (from == "numbers") {
      _list = numbersList;
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

  //get Lists from DB
  void getLists() {
    getNumbersList();
  }

  //Get Collection Firebase
  getCollection(String coll) async {
    return await FirebaseFirestore.instance.collection(coll).get();
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
  List<TextPicCard> _numbersList = [];
  List get numbersList => _numbersList;
  void getNumbersList() async {
    // _list = [];

    await FirebaseFirestore.instance
        .collection('FCNumbers')
        .orderBy('topText')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        numbersList
            .add(TextPicCard.fromJson(doc.data() as Map<String, dynamic>));
      });
    });

    notifyListeners();

    // return list as List<TextPicCard>;

    /*return [
      TextPicCard(
        topText: "1",
        bottomText: "One",
        imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/apple.png',
      ),
      TextPicCard(
        topText: "2",
        bottomText: "Two",
        imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/2ducks.png',
      ),
      TextPicCard(
        topText: "5",
        bottomText: "Five",
        imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/5fish.png',
      ),
      TextPicCard(
        topText: "7",
        bottomText: "Seven",
        imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/7trees.png',
      ),
      TextPicCard(
        topText: "9",
        bottomText: "Nine",
        imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/9ants.png',
      ),
    ];*/
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

  //function: create colours list
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
        color: const Color(0xff8709D4),
      ),
      PicTextCard(
        text: "Orange",
        imgPath: "assets/images/orangee.png",
        color: const Color(0xffFF8929),
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

  List getlistof4colours(Color color, List list) {
    List l = [];
    for (var i = 0; i < list.length; i++) {
      if (list[i].color == color) {
        l.add(list[i]);
        list.removeAt(i);
        break;
      }
    }
    for (var i = 0; i < 3; i++) {
      int ran = Random().nextInt(list.length);
      l.add(list[ran]);
      list.removeAt(ran);
    }
    l.shuffle();
    return l;
  }

  List getlistof4shapes(String shape, List list) {
    List l = [];
    for (var i = 0; i < list.length; i++) {
      if (list[i].text == shape) {
        l.add(list[i]);
        list.removeAt(i);
        break;
      }
    }
    for (var i = 0; i < 3; i++) {
      int ran = Random().nextInt(list.length);
      l.add(list[ran]);
      list.removeAt(ran);
    }
    l.shuffle();
    return l;
  }
}
