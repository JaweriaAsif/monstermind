import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:monstermind/models/objectColor.dart';
import 'package:monstermind/models/objectComp.dart';
import 'package:monstermind/models/picTextCard.dart';
import 'package:monstermind/models/textPicCard.dart';

List<PicTextCard> list = [
  PicTextCard(
    text: "Bear",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/bear.png",
  ),
  PicTextCard(
    text: "Jellyfish",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/jellyfish.png",
  ),
  PicTextCard(
    text: "Butterfly",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/butterfly.png",
  ),
  //
  PicTextCard(
    text: "Penguin",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/penguin.png",
  ),

  PicTextCard(
    text: "Frog",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/frog.png",
  ),
  PicTextCard(
    text: "Panda",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/panda.png",
  ),
  PicTextCard(
    text: "Bat",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/bat.png",
  ),
  PicTextCard(
    text: "Snake",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/snake.png",
  ),
  PicTextCard(
    text: "Shark",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/shark.png",
  ),
  PicTextCard(
    text: "Snail",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/snail.png",
  ),
  PicTextCard(
    text: "Sealion",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/sealion.png",
  ),
];

void addToDB() {
  // addFCBodyParts();
  // addToCollection('FCAnimals');
  // addToCollection('Rhymes');
  // addToCollection('GNumbersQuest');
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
