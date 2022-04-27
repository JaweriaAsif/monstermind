import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:monstermind/models/TextPicCard.dart';
import 'package:monstermind/models/objectShape.dart';
import 'package:monstermind/models/picTextCard.dart';
import 'package:monstermind/models/rhymes.dart';

List<TextPicCard> list = [
  /*TextPicCard(
    bottomText: "Two",
    topText: 2,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/2octopus.png",
  ),
  TextPicCard(
    bottomText: "Three",
    topText: 3,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/3rabbits.png",
  ),
  TextPicCard(
    bottomText: "Three",
    topText: 3,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/3watermelon.png",
  ),
  TextPicCard(
    bottomText: "Four",
    topText: 4,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/4squirrels.png",
  ),
  TextPicCard(
    bottomText: "Five",
    topText: 5,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/5muffins.png",
  ),
  TextPicCard(
    bottomText: "Six",
    topText: 6,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/6carrots.png",
  ),
  TextPicCard(
    bottomText: "Seven",
    topText: 7,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/7watermelon.png",
  ),
  TextPicCard(
    bottomText: "Nine",
    topText: 9,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/9balloons.png",
  ),
  TextPicCard(
    bottomText: "Ten",
    topText: 10,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/10spiders.png",
  ),
  TextPicCard(
    bottomText: "Two",
    topText: 2,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/2ducks.png",
  ),
  TextPicCard(
    bottomText: "Three",
    topText: 3,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/3slices.png",
  ),
  TextPicCard(
    bottomText: "Five",
    topText: 5,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/5fish.png",
  ),
  TextPicCard(
    bottomText: "Six",
    topText: 6,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/6radish.png",
  ),
  TextPicCard(
    bottomText: "Eight",
    topText: 8,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/8chillies.png",
  ),
  TextPicCard(
    bottomText: "Nine",
    topText: 9,
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/9ants.png",
  ),*/
];

// List<ObjectShape> list = [
//   ObjectShape(
//     shape: "Circle",
//     imgPath: "assets/images/ball.png",
//   ),
//   ObjectShape(
//     shape: "Circle",
//     imgPath: "assets/images/orange.png",
//   ),
//   ObjectShape(
//     shape: "Star",
//     imgPath: "assets/images/starfish.png",
//   ),
//   ObjectShape(
//     shape: "Triangle",
//     imgPath: "assets/images/pizza.png",
//   ),
// ];

void addToDB() {
  // addFCBodyParts();
  // addToCollection('FCBodyParts');
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
