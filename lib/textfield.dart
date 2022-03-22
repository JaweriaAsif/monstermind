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
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: label,
        ),
        validator: (text) {
          if (controller.text == null || controller.text.isEmpty) {
            return 'Can\'t be empty';
          }
          if (controller.text.length > 12) {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
      child: TextField(
        readOnly: true,
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          hintText: 'Date of Birth',
        ),
        onTap: () async {
          bool selected = await _selectDate(context);
          if (selected) {
            controller.text = selectedDate.day.toString() +
                "/" +
                selectedDate.month.toString() +
                "/" +
                selectedDate.year.toString();
          }
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
    // String _currentSelectedValue = "Male";
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
          // errorText: errorSnapshot.data == 0
          //     ? Localization.of(context).categoryEmpty
          //     : null),
        ),
      ),
    );
  }
}
