import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  Textfield({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  // Function ontap;

  @override
  Widget build(BuildContext context) {
    // if (ontap == null) {
    //   ontap = () {};
    // }

    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
      child: TextField(
        readOnly: true,
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
          // fontFamily:
        ),
        decoration: InputDecoration(
          hintText: label,
        ),
        // onTap: () {
        //   ontap;
        // },
      ),
    );
  }
}
