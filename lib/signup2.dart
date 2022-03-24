import 'package:flutter/material.dart';
import 'package:monstermind/button.dart';
import 'package:monstermind/hello.dart';
import 'package:monstermind/main.dart';
import 'package:monstermind/textfield.dart';
import 'package:monstermind/user.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String gender = ""; // kachra DB
late DateTime DOB; // kachra DB
User user = User();

class Signup2 extends StatefulWidget {
  const Signup2({Key? key}) : super(key: key);

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerDOB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Image(
                  image: AssetImage('assets/images/Sign up 2.png'),
                  fit: BoxFit.fill,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 500,
                    ),
                    Textfield(
                      controller: _controllerUsername,
                      label: 'Username',
                    ),
                    const Dropdown(),
                    DateTextfield(
                      controller: _controllerDOB,
                      selectedDate: selectedDate,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Btn(
                        text: 'Next',
                        onPress: () {
                          final FormState form =
                              _formKey.currentState as FormState;
                          if (form.validate()) {
                            user = User(
                              name: _controllerUsername.text,
                              gender: gender,
                              DOB: DOB,
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Hello()),
                            );
                          }
                        },
                        alignment: const Alignment(0, 0.95),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
