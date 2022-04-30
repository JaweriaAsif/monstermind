import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monstermind/models/user.dart';

User user = User();

CollectionReference userlist = FirebaseFirestore.instance.collection('Users');

class UserController {
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
  }
}
