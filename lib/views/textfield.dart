import 'package:flutter/material.dart';
import 'package:monstermind/views/signup2.dart';
// import 'package:monstermind/main.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: label,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2EADB5), width: 2),
          ),
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Can\'t be empty';
          }
          if (text.length > 12) {
            return 'Too long - must be shorter than 12 characters';
          }
          return null;
        },
      ),
    );
  }
}

class DateTextfield extends StatelessWidget {
  DateTextfield({
    Key? key,
    required this.controller,
    required this.selectedDate,
  }) : super(key: key);

  final TextEditingController controller;
  DateTime selectedDate;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
      child: TextFormField(
        readOnly: true,
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          hintText: 'Date of Birth',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2EADB5), width: 2),
          ),
        ),
        onTap: () async {
          selected = await _selectDate(context);
          if (selected) {
            DOB = selectedDate;
            controller.text = selectedDate.day.toString() +
                "/" +
                selectedDate.month.toString() +
                "/" +
                selectedDate.year.toString();
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Please select a Date of Birth';
          } else if (selectedDate.isAfter(DateTime.now())) {
            return 'Please select a valid Date of Birth';
          }
          return null;
        },
      ),
    );
  }

  Future<bool> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 90),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (selected != null) {
      selectedDate = selected;
      return true;
    }
    return false;
  }
}

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gender = "";
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = ["Male", "Female"];

    Object? _category;

    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
      child: DropdownButtonFormField(
        items: categories.map((String category) {
          return DropdownMenuItem(
            value: category,
            child: Text(
              category,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          gender = newValue.toString();
          setState(() {
            _category = newValue;
          });
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          if (gender.isEmpty) {
            return 'Please select a Gender';
          }
          return null;
        },
        value: _category,
        decoration: const InputDecoration(
          hintText: "Gender",
          hintStyle: TextStyle(
            fontSize: 18,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2EADB5), width: 2),
          ),
        ),
      ),
    );
  }
}
