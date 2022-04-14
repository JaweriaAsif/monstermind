import 'package:flutter/material.dart';
import 'package:monstermind/button.dart';
import 'package:monstermind/signup2.dart';
import 'package:monstermind/task.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
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
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Signup2()),
                  );
                  // addTask(Task(
                  //   title: "hello",
                  //   description: "snkz",
                  //   dueDate: DateTime.now(),
                  // ));
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
