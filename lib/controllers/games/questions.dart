import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monstermind/models/firebaseFunctions.dart';
import 'package:monstermind/models/objectShape.dart';

class Questions extends ChangeNotifier {
  List _shapesQuest = [];
  List _numbersQuest = [];

  List get shapesQuest => _shapesQuest;
  List get numbersQuest => _numbersQuest;

  Questions() {
    getShapesList();
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
}
