import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monstermind/models/user.dart';

late User user;

class UserController {
  addToDB(User user) {}

  void getFromDB(String email) async {
    CollectionReference userList =
        FirebaseFirestore.instance.collection('Users');

    userList.where('email', isEqualTo: email).get().then((querySnapshot) {
      user =
          User.fromJson(querySnapshot.docs[0].data() as Map<String, dynamic>);
    });
  }
}
