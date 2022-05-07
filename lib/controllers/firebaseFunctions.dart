import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:monstermind/models/objectColor.dart';
import 'package:monstermind/models/objectComp.dart';
import 'package:monstermind/models/objectShape.dart';
import 'package:monstermind/models/picTextCard.dart';
import 'package:monstermind/models/textPicCard.dart';

List<ObjectShape> list = [
  ObjectShape(
    shape: "Star",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/tiltedstar.png",
  ),
  ObjectShape(
    shape: "Star",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/starCookie.png",
  ),
  ObjectShape(
    shape: "Star",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/wand.png",
  ),
  ObjectShape(
    shape: "Star",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/starfruit.png",
  ),
  ObjectShape(
    shape: "Star",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/starGlasses.png",
  ),
  //
  ObjectShape(
    shape: "Diamond",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/kite.png",
  ),
  ObjectShape(
    shape: "Diamond",
    imgPath:
        "gs://monstermind-d1783.appspot.com/assets/images/diamondshape.png",
  ),
  ObjectShape(
    shape: "Diamond",
    imgPath:
        "gs://monstermind-d1783.appspot.com/assets/images/diamondEarrings.png",
  ),
  ObjectShape(
    shape: "Diamond",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/diamondSign.png",
  ),
];

void addToDB() {
  // addFCBodyParts();
  // addToCollection('FCAnimals');
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
