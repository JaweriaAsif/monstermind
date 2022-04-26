import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:monstermind/models/TextPicCard.dart';
import 'package:monstermind/models/picTextCard.dart';
import 'package:monstermind/models/rhymes.dart';

List<Rhymes> list = [
  Rhymes(
      name: "Jack and Jill",
      icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/jandj.png",
      vidID: "XzhesUdAPNo"),
  Rhymes(
      name: "I'm a Little Teapot",
      icon:
          "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/teapot.png",
      vidID: "jtZYTzzdHa8"),
  Rhymes(
      name: "Muffin Man",
      icon:
          "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/muffin.png",
      vidID: "fXFg5QsTcLQ"),
  Rhymes(
      name: "Old McDonald",
      icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/barn.png",
      vidID: "M3WvViAUgyg"),
];

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

void cacheFBImage(String imgPath) {
  FirebaseImage(imgPath).preCache();
}
