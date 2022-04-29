import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:monstermind/controllers/googleSIgnIn.dart';
import 'package:monstermind/views/button.dart';
import 'package:monstermind/views/signup2.dart';
import 'package:monstermind/views/task.dart';
import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      print("signed in!");
      print(_googleSignIn.currentUser!.email);
    } catch (error) {
      print(error);
      print("Can't sign in :(");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Stack(
                fit: StackFit.expand,
                children: const [
                  Image(
                    image: AssetImage('assets/images/Sign up 1.png'),
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Btn(
                text: 'Sign Up',
                onPress: () {
                  _handleSignIn();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Signup2()),
                  );
                },
                alignment: const Alignment(0, 0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
