import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:monstermind/models/PicTextCard.dart';
import 'package:monstermind/models/TextPicCard.dart';

List<TextPicCard> list = [
  TextPicCard(
    topText: 3,
    bottomText: "three",
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/3slices.png',
  ),
  TextPicCard(
    topText: 4,
    bottomText: "Four",
    imgPath:
        'gs://monstermind-d1783.appspot.com/assets/images/4bellpeppers.png',
  ),
  TextPicCard(
    topText: 6,
    bottomText: "Six",
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/6radish.png',
  ),
  TextPicCard(
    topText: 8,
    bottomText: "Eight",
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/4chillies.png',
  ),
  TextPicCard(
    topText: 10,
    bottomText: "Ten",
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/10spiders.png',
  ),
];

void addToDB() {
  // addFCNumbers();
}

Future<void> addFCNumbers() async {
  CollectionReference numList =
      FirebaseFirestore.instance.collection('FCNumbers');

  list.forEach((element) async {
    await numList
        .add(element.toJson())
        .then((value) => print("Task Added"))
        .catchError((error) => print("Failed to add task: $error"));
  });
}

Future<void> addFCAnimals() async {
  CollectionReference numList =
      FirebaseFirestore.instance.collection('FCAnimals');

  list.forEach((element) async {
    await numList
        .add(element.toJson())
        .then((value) => print("Task Added"))
        .catchError((error) => print("Failed to add task: $error"));
  });
}

Future<void> addFCFruits() async {
  CollectionReference numList =
      FirebaseFirestore.instance.collection('FCFruits');

  list.forEach((element) async {
    await numList
        .add(element.toJson())
        .then((value) => print("Task Added"))
        .catchError((error) => print("Failed to add task: $error"));
  });
}

Future<void> addFCVeggies() async {
  CollectionReference numList =
      FirebaseFirestore.instance.collection('FCVeggies');

  list.forEach((element) async {
    await numList
        .add(element.toJson())
        .then((value) => print("Task Added"))
        .catchError((error) => print("Failed to add task: $error"));
  });
}
