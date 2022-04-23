import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:monstermind/models/PicTextCard.dart';
import 'package:monstermind/models/TextPicCard.dart';
import 'package:monstermind/models/rhymes.dart';

List<Rhymes> list = [
  Rhymes(
    name: "Itsy Bitsy Spider",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/spider.png",
    vidID: 'w_lCi8U49mY',
  ),
  Rhymes(
    name: "Slippery Fish",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/fish.png",
    vidID: 'BIvpZ4PPrx0',
  ),
  Rhymes(
    name: "Eyes Cold Lemonade",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/lemon.png",
    vidID: '165VjNKRNdw',
  ),
  Rhymes(
    name: "Five Little Monkeys",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/monkey.png",
    vidID: 'b0NHrFNZWh0',
  ),
  Rhymes(
    name: "Wheels on the Bus",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/bus.png",
    vidID: 'e_04ZrNroTo',
  ),
  Rhymes(
    name: "Twinkle Twinkle",
    icon:
        "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/tiltedstar.png",
    vidID: 'yCjJyiqpAuU',
  ),
  //
  Rhymes(
    name: "Ek Dou Teen Hathi Nikle",
    icon:
        "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/elephant.png",
    vidID: 'LLPre-OcL34',
  ),
  Rhymes(
    name: "Batakh Ne Na Maani Haar",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/duck.png",
    vidID: 'Gi79pVJXsmo',
  ),
  Rhymes(
    name: "Dekho Aaya Sher",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/lion.png",
    vidID: 'iuFk-PwYzQ4',
  ),
  Rhymes(
    name: "Pinjray Mein Chirya",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/bird.png",
    vidID: 'CckcBA8PMxw',
  ),
  Rhymes(
    name: "Bholay Bhaalu Bhaiyya",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/bear.png",
    vidID: 'xYsU-qlAcLQ',
  ),
  Rhymes(
    name: "Geeli Geeli Machli",
    icon:
        "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/Untitled.png",
    vidID: 'Wxm0vZGiKBM',
  ),
  Rhymes(
    name: "Mein Hoon Ek Khargosh",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/rabbit.png",
    vidID: 'o5ioxlGXbUc',
  ),
  Rhymes(
    name: "Kuchu Kuchu Kachwa",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/turtle.png",
    vidID: 'qNaqOQs_fBQ',
  ),
  Rhymes(
    name: "London Bridge is Falling Down",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/bridge.png",
    vidID: 'pUu0FWlMpgk',
  ),
  Rhymes(
    name: "Baa Baa Black Sheep",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/sheep.png",
    vidID: 'MR5XSOdjKMA',
  ),
  Rhymes(
    name: "If You're Happy and You Know It",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/happy.png",
    vidID: 'M6LoRZsHMSs',
  ),
  Rhymes(
    name: "Humpty Dumpty",
    icon: "gs://monstermind-d1783.appspot.com/assets/images/Rhymes/humpty.png",
    vidID: 'nrv495corBc',
  ),
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