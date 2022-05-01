import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:monstermind/models/user.dart';

CollectionReference userlist = FirebaseFirestore.instance.collection('Users');
User user = User();

class UserController {
  // User get user => _user;

  Future<void> addToDB(User user) async {
    await userlist
        .add(user.toJson())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add: $error"));
  }

  Future<void> getFromDB(String email) async {
    await userlist
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        user = (User.fromJson(doc.data() as Map<String, dynamic>));
      });
    });
    // notifyListeners();
  }

  bool userNotFound() {
    return user.email == "";
  }

  String calculateAge() {
    DateTime currentDate = DateTime.now();
    DateTime birthDate = user.DOB!;

    int age = currentDate.year - birthDate.year;

    int month1 = currentDate.month;
    int month2 = birthDate.month;

    int day1 = currentDate.day;
    int day2 = birthDate.day;

    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      if (day2 > day1) {
        age--;
      }
    }

    //age in months
    if (age == 0) {
      int months = 0;

      //born this year
      if (currentDate.year == birthDate.year) {
        months = month1 - month2;
        if (day2 > day1) months--;
        return months.toString() + " months";
      }

      //born last year
      months = 12 - month2 + month1;
      if (day2 > day1) months--;
      return months.toString() + " months";
    }

    //age in years
    return age.toString() + " years";
  }
}
