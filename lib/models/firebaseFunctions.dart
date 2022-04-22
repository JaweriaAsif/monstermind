import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:monstermind/models/PicTextCard.dart';
import 'package:monstermind/models/TextPicCard.dart';

List<PicTextCard> list = [];

void addToDB() {
  // addFCBodyParts();
  // addToCollection('FCBodyParts');
  // addToCollection('Rhymes');
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

/*
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

Future<void> addFCColours() async {
  CollectionReference numList =
      FirebaseFirestore.instance.collection('FCColours');

  list.forEach((element) async {
    await numList
        .add(element.toJson())
        .then((value) => print("Task Added"))
        .catchError((error) => print("Failed to add task: $error"));
  });
}

Future<void> addFCShapes() async {
  CollectionReference numList =
      FirebaseFirestore.instance.collection('FCShapes');

  list.forEach((element) async {
    await numList
        .add(element.toJson())
        .then((value) => print("Task Added"))
        .catchError((error) => print("Failed to add task: $error"));
  });
}

Future<void> addFCBodyParts() async {
  CollectionReference numList =
      FirebaseFirestore.instance.collection('FCBodyParts');

  list.forEach((element) async {
    await numList
        .add(element.toJson())
        .then((value) => print("Task Added"))
        .catchError((error) => print("Failed to add task: $error"));
  });
}

Future<void> addRhymes() async {
  CollectionReference rhymesList =
      FirebaseFirestore.instance.collection('Rhymes');

  list.forEach((element) async {
    await rhymesList
        .add(element.toJson())
        .then((value) => print("Task Added"))
        .catchError((error) => print("Failed to add task: $error"));
  });
}
*/