import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/models/TextPicCard.dart';
import 'package:monstermind/models/objectColor.dart';
import 'package:monstermind/models/objectShape.dart';
import 'package:monstermind/models/picTextCard.dart';
import 'package:monstermind/models/rhymes.dart';

List<ObjectShape> list = [
  ObjectShape(
    shape: "Crescent",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/bananashape.png",
  ),
  ObjectShape(
    shape: "Crescent",
    imgPath:
        "gs://monstermind-d1783.appspot.com/assets/images/crescentmoon.png",
  ),
];

void addToDB() {
  // addFCBodyParts();
  // addToCollection('FCBodyParts');
  // addToCollection('Rhymes');
  // addToCollection('GShapesQuest');
}

Future<void> addToCollection(String coll) async {
  CollectionReference addList = FirebaseFirestore.instance.collection(coll);

  list.forEach((element) async {
    await addList
        .add(element.toJson())
        .then((value) => print("Added"))
        .catchError((error) => print("Failed to add: $error"));
  });
}

void cacheFBImage(String imgPath) async {
  await FirebaseImage(imgPath).preCache();
}
