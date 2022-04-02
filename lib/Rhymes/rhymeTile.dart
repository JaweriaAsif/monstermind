import 'package:flutter/material.dart';
import 'package:monstermind/Rhymes/rhymes.dart';

class RhymeTile extends StatefulWidget {
  const RhymeTile({
    Key? key,
    required this.rhyme,
  }) : super(key: key);

  final Rhymes rhyme;

  @override
  State<RhymeTile> createState() => _RhymeTileState();
}

class _RhymeTileState extends State<RhymeTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffFA978B),
    );
  }
}
