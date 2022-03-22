import 'package:flutter/material.dart';
import 'package:monstermind/button.dart';
import 'package:monstermind/textfield.dart';

class Signup2 extends StatefulWidget {
  const Signup2({Key? key}) : super(key: key);

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  final TextEditingController _controllerUsername = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            Stack(
              fit: StackFit.expand,
              children: const [
                Image(
                  image: AssetImage('assets/images/Sign up 2.png'),
                  fit: BoxFit.fill,
                ),
              ],
            ),
            // TextField(

            //   controller: _controllerUsername,
            // ),
            Textfield(controller: _controllerUsername, label: 'Username'),
            Btn(
              text: 'Sign Up',
              onPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Signup2()),
                );
              },
              alignment: const Alignment(0, 0.95),
            ),
          ],
        ),
      ),
    );
  }
}
