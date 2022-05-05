import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:monstermind/controllers/userController.dart';

class PointsProvider extends ChangeNotifier {
  int _points = 0;

  int get points => _points;

  setPoints(int value) {
    _points = value;
    notifyListeners();
  }

  void addPoints(int add) async {
    await addPointsDB(add);
    await setPoints(points + add);
    user.points = _points; //should we?
    notifyListeners();
  }

  Future<void> addPointsDB(int add) async {
    CollectionReference userlist =
        FirebaseFirestore.instance.collection('Users');
    await userlist.where('email', isEqualTo: user.email).get().then((value) {
      userlist
          .doc(value.docs[0].id)
          .update({'points': user.points + add}).then((value) {
        print("New user points: ${user.points}!");

        // addPoints(add);
        // DB? or fine. Check
      });
    });
  }

  Future<void> getPointsDB() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: user.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        int p = (doc.data() as Map<String, dynamic>)['points'];

        user.points = p;
        setPoints(p);
      });
    });
  }
}
