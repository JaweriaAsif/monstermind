import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:monstermind/controllers/googleSignIn.dart';
import 'package:monstermind/controllers/userController.dart';
import 'package:monstermind/views/button.dart';
import 'package:monstermind/views/hello.dart';
import 'package:monstermind/views/signup2.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key, required this.signUp}) : super(key: key);

  final bool signUp;

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _handleSignIn() async {
    try {
      await googleSignIn.signIn();
      print("signed in!");
      user.email = googleSignIn.currentUser!.email;
      print(user.email);
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
                text: "Sign In",
                icon: widget.signUp,
                onPress: () async {
                  await _handleSignIn();
                  await UserController().getFromDB(user.email);
                  GoogleSign().handleNavigation2(widget.signUp, context);
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
