import 'package:flutter/material.dart';
import 'package:monstermind/main.dart';

class Textfield extends StatelessWidget {
  Textfield({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: label,
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Can\'t be empty';
          }
          if (text.length > 12) {
            return 'Too long';
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
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
      child: TextFormField(
        readOnly: true,
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          hintText: 'Date of Birth',
        ),
        onTap: () async {
          selected = await _selectDate(context);
          if (selected) {
            controller.text = selectedDate.day.toString() +
                "/" +
                selectedDate.month.toString() +
                "/" +
                selectedDate.year.toString();
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          if (!selected) {
            return 'Please select a Date of Birth';
          } else if (selectedDate.isAfter(DateTime.now()) ||
              (selectedDate.day == DateTime.now().day &&
                  selectedDate.month == DateTime.now().month &&
                  selectedDate.year == DateTime.now().year)) {
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

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    List<String> categories = ["Male", "Female"];

    Object? _category;

    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          if (_category == null || _category.toString().isEmpty) {
            return 'Please select a Gender';
          }
          return null;
        },
        onChanged: (newValue) {
          gender = _category.toString();
          setState(() => _category = newValue);
        },
        value: _category,
        decoration: const InputDecoration(
          hintText: "Gender",
          hintStyle: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
