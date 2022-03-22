import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
        ),
        SizedBox(
          child: TextField(
            scrollPadding: EdgeInsets.only(bottom: 40),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
