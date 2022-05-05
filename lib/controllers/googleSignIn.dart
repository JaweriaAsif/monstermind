import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monstermind/controllers/userController.dart';
import 'package:monstermind/views/Main&SignUp/hello.dart';
import 'package:monstermind/views/Main&SignUp/signup1.dart';
import 'package:monstermind/views/Main&SignUp/signup2.dart';

GoogleSignInAccount? currentUser;

GoogleSignIn googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class GoogleSign {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  handleNavigation1(context) {
    if (UserController().userNotFound()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUp1(
            signUp: true,
          ),
        ),
      );
    } else if (!user.isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUp1(
            signUp: false,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Hello()));
    }
  }

  handleNavigation2(bool signUp, context) {
    //Google signed in
    if (!UserController().userNotFound() && signUp) {
      //user exists in DB
      if (user.name != "") {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Hello()),
        );

        UserController().setLoggedIn(true);
      }
      //NEW user - create account
      else {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Signup2()),
        );
      }
    }

    //user exists in DB but just googlesigned in
    else if (!UserController().userNotFound() && !signUp) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const Hello()),
      );
      UserController().setLoggedIn(true);
    }
  }
}
