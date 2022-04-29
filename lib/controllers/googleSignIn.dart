import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSign {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignIn get googleSignIn => _googleSignIn;

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      print("Signed In!");
    } catch (error) {
      print(error);
      print("Signed In error!");
    }
  }
}
