import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:monstermind/models/objectColor.dart';
import 'package:monstermind/models/objectComp.dart';
import 'package:monstermind/models/textPicCard.dart';

List<TextPicCard> list = [
  TextPicCard(
    topText: 1,
    bottomText: "One",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/muffin.png",
  ),
  TextPicCard(
    topText: 1,
    bottomText: "One",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/rabbit.png",
  ),
  TextPicCard(
    topText: 1,
    bottomText: "One",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/squirrel.png",
  ),
  TextPicCard(
    topText: 1,
    bottomText: "One",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/cow.png",
  ),
  TextPicCard(
    topText: 1,
    bottomText: "One",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/strawberry.png",
  ),
  TextPicCard(
    topText: 3,
    bottomText: "Three",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/3squirrels.png",
  ),
  TextPicCard(
    topText: 3,
    bottomText: "Three",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/3ducks.png",
  ),
  //
  TextPicCard(
    topText: 4,
    bottomText: "Four",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/4carrots.png",
  ),
  TextPicCard(
    topText: 4,
    bottomText: "Four",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/4rabbits.png",
  ),
  TextPicCard(
    topText: 4,
    bottomText: "Four",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/4radishes.png",
  ),
  //
  TextPicCard(
    topText: 5,
    bottomText: "Five",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/5balloons.png",
  ),
  TextPicCard(
    topText: 5,
    bottomText: "Five",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/5slices.png",
  ),
  //
  TextPicCard(
    topText: 6,
    bottomText: "Six",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/6ants.png",
  ),
  TextPicCard(
    topText: 6,
    bottomText: "Six",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/6spiders.png",
  ),
  TextPicCard(
    topText: 7,
    bottomText: "Seven",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/7muffins.png",
  ),
  TextPicCard(
    topText: 8,
    bottomText: "Eight",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/8ants.png",
  ),
  TextPicCard(
    topText: 8,
    bottomText: "Eight",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/8carrots.png",
  ),
  TextPicCard(
    topText: 8,
    bottomText: "Eight",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/8muffins.png",
  ),
  TextPicCard(
    topText: 8,
    bottomText: "Eight",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/8spiders.png",
  ),
  TextPicCard(
    topText: 9,
    bottomText: "Nine",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/9watermelon.png",
  ),
  TextPicCard(
    topText: 10,
    bottomText: "Ten",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/10balloons.png",
  ),
  TextPicCard(
    topText: 10,
    bottomText: "Ten",
    imgPath: "gs://monstermind-d1783.appspot.com/assets/images/10muffins.png",
  ),
];

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
