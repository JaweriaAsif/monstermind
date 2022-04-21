import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monstermind/models/PicTextCard.dart';

import 'package:monstermind/models/TextPicCard.dart';

class CardContent extends ChangeNotifier {
  List _list = [];
  // String? from = "";

  // CardContent() {
  //   // getTasks();
  //   notifyListeners();
  // }

  CardContent() {
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
      _list = animalsList;
    } else if (from == "fruits") {
      _list = fruitsList;
    } else if (from == "veggies") {
      _list = veggiesList;
    }
    return _list;
  }

  //get Lists from DB
  void getLists() {
    getNumbersList();
    getAnimalsList();
    getFruitsList();
    getVeggiesList();
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
  }

  //function: create shapes list
  List<PicTextCard> shapesList() {
    return [
      PicTextCard(
        text: "Circle",
        imgPath: "assets/images/circle.png",
        color: "0xffF11162",
      ),
      PicTextCard(
        text: "Square",
        imgPath: "assets/images/square.png",
        color: "0xff5CD978",
      ),
      PicTextCard(
        text: "Triangle",
        imgPath: "assets/images/triangle.png",
        color: "0xff2EA3F8",
      ),
      PicTextCard(
        text: "Star",
        imgPath: "assets/images/star.png",
        color: "0xffD9825C",
      ),
      PicTextCard(
        text: "Rectangle",
        imgPath: "assets/images/rectangle.png",
        color: "0xffC915D8",
      ),
    ];
  }

  //function: create colours list
  List<PicTextCard> coloursList() {
    return [
      PicTextCard(
        text: "Red",
        imgPath: "assets/images/red.png",
        color: "0xffF11162",
      ),
      PicTextCard(
        text: "Green",
        imgPath: "assets/images/green.png",
        color: "0xff5CD978",
      ),
      PicTextCard(
        text: "Blue",
        imgPath: "assets/images/blue.png",
        color: "0xff2EA3F8",
      ),
      PicTextCard(
        text: "Yellow",
        imgPath: "assets/images/yellow.png",
        color: "0xffF9DF00",
      ),
      PicTextCard(
        text: "Purple",
        imgPath: "assets/images/purple.png",
        color: "0xff8709D4",
      ),
      PicTextCard(
        text: "Orange",
        imgPath: "assets/images/orangee.png",
        color: "0xffFF8929",
      ),
    ];
  }

  //function: create animals list
  List<PicTextCard> _animalsList = [];
  List get animalsList => _animalsList;
  Future<void> getAnimalsList() async {
    await FirebaseFirestore.instance
        .collection('FCAnimals')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        animalsList
            .add(PicTextCard.fromJson(doc.data() as Map<String, dynamic>));
      });
    });

    notifyListeners();
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

  //function: create fruits parts list
  List<PicTextCard> _fruitsList = [];
  List get fruitsList => _fruitsList;
  void getFruitsList() async {
    await FirebaseFirestore.instance
        .collection('FCFruits')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        fruitsList
            .add(PicTextCard.fromJson(doc.data() as Map<String, dynamic>));
      });
    });

    notifyListeners();
  }

  //function: create vegetables list
  List<PicTextCard> _veggiesList = [];
  List get veggiesList => _veggiesList;
  Future<void> getVeggiesList() async {
    await FirebaseFirestore.instance
        .collection('FCVeggies')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        veggiesList
            .add(PicTextCard.fromJson(doc.data() as Map<String, dynamic>));
      });
    });

    notifyListeners();
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
