import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:monstermind/models/objectColor.dart';
import 'package:monstermind/models/objectComp.dart';
import 'package:monstermind/models/objectShape.dart';
import 'package:monstermind/models/picTextCard.dart';
import 'package:monstermind/models/textPicCard.dart';

List<ObjectShape> list = [
  ObjectShape(
    shape: 'Arrow',
    imgPath:
        'gs://monstermind-d1783.appspot.com/assets/images/arrowRoadSign.png',
  ),
  ObjectShape(
    shape: 'Circle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/basketball.png',
  ),
  ObjectShape(
    shape: 'Crescent',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/cashew.png',
  ),
  ObjectShape(
    shape: 'Circle',
    imgPath:
        'gs://monstermind-d1783.appspot.com/assets/images/circleButton.png',
  ),
  ObjectShape(
    shape: 'Crescent',
    imgPath:
        'gs://monstermind-d1783.appspot.com/assets/images/crescentCookie.png',
  ),
  ObjectShape(
    shape: 'Crescent',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/croissant.png',
  ),
  ObjectShape(
    shape: 'Circle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/donut.png',
  ),
  ObjectShape(
    shape: 'Circle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/gameWheel.png',
  ),
  ObjectShape(
    shape: 'Circle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/globe.png',
  ),
  ObjectShape(
    shape: 'Semicircle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/halfPizza.png',
  ),
  ObjectShape(
    shape: 'Semicircle',
    imgPath:
        'gs://monstermind-d1783.appspot.com/assets/images/halfWatermelon.png',
  ),
  ObjectShape(
    shape: 'Semicircle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/handfan.png',
  ),
  ObjectShape(
    shape: 'Heart',
    imgPath:
        'gs://monstermind-d1783.appspot.com/assets/images/heartBalloon.png',
  ),
  ObjectShape(
    shape: 'Heart',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/heartCookie.png',
  ),
  ObjectShape(
    shape: 'Heart',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/heartGift.png',
  ),
  ObjectShape(
    shape: 'Heart',
    imgPath:
        'gs://monstermind-d1783.appspot.com/assets/images/heartGlasses.png',
  ),
  ObjectShape(
    shape: 'Heart',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/heartMirror.png',
  ),
  ObjectShape(
    shape: 'Heart',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/heartPillow.png',
  ),
  ObjectShape(
    shape: 'Heart',
    imgPath:
        'gs://monstermind-d1783.appspot.com/assets/images/heartStrawberry.png',
  ),
  ObjectShape(
    shape: 'Circle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/kiwiSlice.png',
  ),
  ObjectShape(
    shape: 'Parallelogram',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/mirror.png',
  ),
  ObjectShape(
    shape: 'Rectangle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/notebook.png',
  ),
  ObjectShape(
    shape: 'Arrow',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/nowAndArrow.png',
  ),
  ObjectShape(
    shape: 'Semicircle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/orangeSlice.png',
  ),
  ObjectShape(
    shape: 'Parallelogram',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/parrToy.png',
  ),
  ObjectShape(
    shape: 'Parallelogram',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/parrWood.png',
  ),
  ObjectShape(
    shape: 'Parallelogram',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/railing.png',
  ),
  ObjectShape(
    shape: 'Semicircle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/rainbow.png',
  ),
  ObjectShape(
    shape: 'Arrow',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/randomArrow.png',
  ),
  ObjectShape(
    shape: 'Crescent',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/shapeChilli.png',
  ),
  ObjectShape(
    shape: 'Circle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/shapeSun.png',
  ),
  ObjectShape(
    shape: 'Parallelogram',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/shelf.png',
  ),
  ObjectShape(
    shape: 'Parallelogram',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/solarpanel.png',
  ),
  ObjectShape(
    shape: 'Star',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/starBalloon.png',
  ),
  ObjectShape(
    shape: 'Star',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/starCookie.png',
  ),
  ObjectShape(
    shape: 'Circle',
    imgPath:
        'gs://monstermind-d1783.appspot.com/assets/images/steeringWheel.png',
  ),
  ObjectShape(
    shape: 'Circle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/woodStump.png',
  ),
  ObjectShape(
    shape: 'Circle',
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/yarn.png',
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

Future<void> cacheFBImage(String imgPath) async {
  await FirebaseImage(imgPath).preCache();
}
