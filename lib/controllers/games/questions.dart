import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monstermind/models/firebaseFunctions.dart';
import 'package:monstermind/models/objectShape.dart';
import 'package:monstermind/models/textPicCard.dart';

class Questions extends ChangeNotifier {
  List _shapesQuest = [];
  List _numbersQuest = [];

  List get shapesQuest => _shapesQuest;
  List get numbersQuest => _numbersQuest;

  Questions() {
    getShapesList();
    getNumbersList();
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
}
