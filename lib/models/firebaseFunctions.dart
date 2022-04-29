import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:monstermind/models/objectComp.dart';

List<ObjectComp> list = [
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/elephant.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/whale.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/balloon.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/ball.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/cow.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/spider.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/strawberry.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/orange.png',
  ),

  //
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/rabbit.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/carrot.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/squirrel.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/radish.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/bowtie.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/alligator.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/peachfruit.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/cat.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/cupcake.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/duck.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/gingerbman.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/jellyfish.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/leaf.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/starfish.png',
  ),
  ObjectComp(
    imgPath: 'gs://monstermind-d1783.appspot.com/assets/images/turtle.png',
  ),
];

void addToDB() {
  // addFCBodyParts();
  // addToCollection('FCBodyParts');
  // addToCollection('Rhymes');
  // addToCollection('GCompQuest');
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
