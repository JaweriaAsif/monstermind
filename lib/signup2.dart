import 'package:flutter/material.dart';
import 'package:monstermind/button.dart';
import 'package:monstermind/textfield.dart';

final _formKey = GlobalKey<FormState>();
String _name = '';

class Signup2 extends StatefulWidget {
  const Signup2({Key? key}) : super(key: key);

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerGender = TextEditingController();
  final TextEditingController _controllerDOB = TextEditingController();

  // void _submit() {
  //   // validate all the form fields
  //   if (_formKey.currentState!.validate()) {
  //     // on success, notify the parent widget
  //     widget.onSubmit(_name);
  //   }
  // }

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

                    // Form(child: )
                    //
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
                      padding: const EdgeInsets.only(top: 25),
                      child: Btn(
                        text: 'Next',
                        onPress: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       builder: (context) => const Signup2()),
                          // );
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
