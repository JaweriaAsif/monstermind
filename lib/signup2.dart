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
  final TextEditingController _controllerGender = TextEditingController();
  final TextEditingController _controllerDOB = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
              Column(
                children: [
                  const SizedBox(
                    height: 500,
                  ),

                  //
                  Textfield(
                    controller: _controllerUsername,
                    label: 'Username',
                  ),

                  Textfield(
                    controller: _controllerGender,
                    label: 'Gender',
                  ),

                  InkWell(
                    child: Textfield(
                      controller: _controllerDOB,
                      label: 'Date of Birth',
                    ),
                    onTap: () async {
                      bool selected = await _selectDate(context);
                      if (selected) {
                        _controllerDOB.text = selectedDate.day.toString() +
                            "/" +
                            selectedDate.month.toString() +
                            "/" +
                            selectedDate.year.toString();
                      }
                    },
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Btn(
                      text: 'Next',
                      onPress: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Signup2()),
                        );
                      },
                      alignment: const Alignment(0, 0.95),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 80),
    );
    if (selected != null) {
      selectedDate = selected;
      return true;
    }
    return false;
  }
}
