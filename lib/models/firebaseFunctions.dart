import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:monstermind/models/TextPicCard.dart';

List<TextPicCard> list = [];

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
