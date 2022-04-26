import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monstermind/models/firebaseFunctions.dart';
import 'package:monstermind/models/rhymes.dart';

class RhymesProvider extends ChangeNotifier {
  RhymesProvider() {
    getRhymes();
    notifyListeners();
  }

  List<Rhymes> _rhymes = [];

  List<Rhymes> get rhymes => _rhymes;

  addInOrder(Rhymes r) {
    rhymes.add(r);

    for (int i = rhymes.length - 1; i > 0; i--) {
      if (r.isAbove(rhymes[i - 1])) {
        //swap
        Rhymes temp = rhymes[i - 1];
        rhymes[i - 1] = r;
        rhymes[i] = temp;
      }
    }
  }

  bool isFav(Rhymes r) => r.isFav;

  void changeFav(Rhymes r) {
    r.isFav = !r.isFav;
    rhymes.remove(r);
    addInOrder(r);
    notifyListeners();
    changeFavDB(r, r.isFav); //change in DB
  }

  //DB Functions

  CollectionReference rhymesList =
      FirebaseFirestore.instance.collection('Rhymes');

  void getRhymes() async {
    await rhymesList
        .orderBy('isFav', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Rhymes toAdd = Rhymes.fromJson(doc.data() as Map<String, dynamic>);
        rhymes.add(toAdd);
        cacheFBImage(toAdd.icon);
      });
    });

    notifyListeners();
  }

  void changeFavDB(Rhymes rhyme, bool setFav) async {
    await rhymesList
        .where('name', isEqualTo: rhyme.name)
        .where('vidID', isEqualTo: rhyme.vidID)
        .get()
        .then((value) {
      rhymesList.doc(value.docs[0].id).update({'isFav': setFav}).then((value) {
        setFav
            ? print("${rhyme.name} set as Fav!")
            : print("${rhyme.name} unset as Fav!");
      });
    }).onError((error, stackTrace) {
      rhyme.isFav = !rhyme.isFav;
      notifyListeners();
    });
  }
}
