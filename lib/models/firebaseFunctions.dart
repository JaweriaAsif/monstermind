import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:monstermind/models/TextPicCard.dart';

List<TextPicCard> list = [
  TextPicCard(
    topText: 1,
    bottomText: "One",
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/apple.png',
  ),
  TextPicCard(
    topText: 2,
    bottomText: "Two",
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/2ducks.png',
  ),
  TextPicCard(
    topText: 5,
    bottomText: "Five",
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/5fish.png',
  ),
  TextPicCard(
    topText: 7,
    bottomText: "Seven",
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/7trees.png',
  ),
  TextPicCard(
    topText: 9,
    bottomText: "Nine",
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/9ants.png',
  ),
];

void addToDB() {
  addFCNumbers();
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
