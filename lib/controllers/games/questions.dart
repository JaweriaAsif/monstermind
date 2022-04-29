import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monstermind/models/firebaseFunctions.dart';
import 'package:monstermind/models/objectColor.dart';
import 'package:monstermind/models/objectComp.dart';
import 'package:monstermind/models/objectShape.dart';
import 'package:monstermind/models/textPicCard.dart';

class Questions extends ChangeNotifier {
  List _shapesQuest = [];
  List _numbersQuest = [];
  List _colorsQuest = [];
  List _compQuest = [];

  List get shapesQuest => _shapesQuest;
  List get numbersQuest => _numbersQuest;
  List get colorsQuest => _colorsQuest;
  List get compQuest => _compQuest;

  Questions() {
    getShapesList();
    getNumbersList();
    getColorsList();
    getCompList();
  }

  void getShapesList() async {
    await FirebaseFirestore.instance
        .collection('GShapesQuest')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ObjectShape toAdd =
            ObjectShape.fromJson(doc.data() as Map<String, dynamic>);
        shapesQuest.add(toAdd);
        cacheFBImage(toAdd.imgPath);
      });
    });

    notifyListeners();
  }

  void getColorsList() async {
    await FirebaseFirestore.instance
        .collection('GColorsQuest')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ObjectColor toAdd =
            ObjectColor.fromJson(doc.data() as Map<String, dynamic>);
        colorsQuest.add(toAdd);
        cacheFBImage(toAdd.imgPath);
      });
    });

    notifyListeners();
  }

  void getNumbersList() async {
    await FirebaseFirestore.instance
        .collection('GNumbersQuest')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        TextPicCard toAdd =
            TextPicCard.fromJson(doc.data() as Map<String, dynamic>);
        numbersQuest.add(toAdd);
        cacheFBImage(toAdd.imgPath);
      });
    });

    notifyListeners();
  }

  void getCompList() async {
    await FirebaseFirestore.instance
        .collection('GCompQuest')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ObjectComp toAdd =
            ObjectComp.fromJson(doc.data() as Map<String, dynamic>);
        compQuest.add(toAdd);
        cacheFBImage(toAdd.imgPath);
      });
    });

    notifyListeners();
  }
}
