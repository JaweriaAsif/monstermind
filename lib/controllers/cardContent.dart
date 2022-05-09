import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monstermind/models/PicTextCard.dart';

import 'package:monstermind/models/TextPicCard.dart';
import 'package:monstermind/controllers/firebaseFunctions.dart';
import 'package:monstermind/controllers/tts.dart';

class CardContent extends ChangeNotifier {
  List _list = [];

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
      _list = shapesList;
    } else if (from == "colours") {
      _list = coloursList;
    } else if (from == "body") {
      _list = bodyPartsList;
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
    getColoursList();
    getShapesList();
    getBodyPartsList();
  }

  // //Get Collection Firebase
  // getCollection(String coll) async {
  //   return await FirebaseFirestore.instance.collection(coll).get();
  // }

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
        TextPicCard toAdd =
            TextPicCard.fromJson(doc.data() as Map<String, dynamic>);
        numbersList.add(toAdd);
        cacheFBImage(toAdd.imgPath);
      });
    });

    notifyListeners();
  }

  //function: create shapes list
  List<PicTextCard> _shapesList = [];
  List get shapesList => _shapesList;
  Future<void> getShapesList() async {
    await FirebaseFirestore.instance
        .collection('FCShapes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        PicTextCard toAdd =
            PicTextCard.fromJson(doc.data() as Map<String, dynamic>);
        shapesList.add(toAdd);
        await cacheFBImage(toAdd.imgPath);
      });
    });
    notifyListeners();
  }

  //function: create colours list
  List<PicTextCard> _coloursList = [];
  List get coloursList => _coloursList;
  void getColoursList() async {
    await FirebaseFirestore.instance
        .collection('FCColours')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        PicTextCard toAdd =
            PicTextCard.fromJson(doc.data() as Map<String, dynamic>);
        coloursList.add(toAdd);
        await cacheFBImage(toAdd.imgPath);
      });
    });

    notifyListeners();
  }

  //function: create animals list
  List<PicTextCard> _animalsList = [];
  List get animalsList => _animalsList;
  void getAnimalsList() async {
    await FirebaseFirestore.instance
        .collection('FCAnimals')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        PicTextCard toAdd =
            PicTextCard.fromJson(doc.data() as Map<String, dynamic>);
        animalsList.add(toAdd);
        await cacheFBImage(toAdd.imgPath);
      });
    });

    notifyListeners();
  }

  //function: create body parts list
  List<PicTextCard> _bodyPartsList = [];
  List get bodyPartsList => _bodyPartsList;
  void getBodyPartsList() async {
    await FirebaseFirestore.instance
        .collection('FCBodyParts')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        PicTextCard toAdd =
            PicTextCard.fromJson(doc.data() as Map<String, dynamic>);
        bodyPartsList.add(toAdd);
        await cacheFBImage(toAdd.imgPath);
      });
    });

    notifyListeners();
  }

  //function: create fruits parts list
  List<PicTextCard> _fruitsList = [];
  List get fruitsList => _fruitsList;
  void getFruitsList() async {
    await FirebaseFirestore.instance
        .collection('FCFruits')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        PicTextCard toAdd =
            PicTextCard.fromJson(doc.data() as Map<String, dynamic>);
        fruitsList.add(toAdd);
        await cacheFBImage(toAdd.imgPath);
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
      querySnapshot.docs.forEach((doc) async {
        PicTextCard toAdd =
            PicTextCard.fromJson(doc.data() as Map<String, dynamic>);
        veggiesList.add(toAdd);
        await cacheFBImage(toAdd.imgPath);
      });
    });

    notifyListeners();
  }

  //tts function
  void speak({required String from, required content}) {
    String toSpeak = "";
    if (from == "numbers") {
      toSpeak = (content as TextPicCard).bottomText;
    } else if (from == "alphabets") {
      toSpeak = (content as String).substring(0, 1);
    } else {
      toSpeak = (content as PicTextCard).text;
    }

    flutterTts.speak(toSpeak);
  }
}
