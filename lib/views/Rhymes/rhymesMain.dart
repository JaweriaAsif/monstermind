import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/ryhmesProvider.dart';
import 'package:monstermind/models/rhymes.dart';
import 'package:monstermind/views/LetsMain/letsPageMain.dart';
import 'package:monstermind/views/Rhymes/rhymeTile.dart';
import 'package:monstermind/views/loadingCircle.dart';

import 'package:provider/provider.dart';

class RhymesMain extends StatefulWidget {
  const RhymesMain({Key? key}) : super(key: key);

  @override
  State<RhymesMain> createState() => _RhymesMainState();
}

class _RhymesMainState extends State<RhymesMain> {
  @override
  Widget build(BuildContext context) {
    List<Rhymes> rhymes = context.watch<RhymesProvider>().rhymes;

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (!isLandscape) {
      return LetsPageMain(
        imgPath: 'assets/images/crab bg.jpg',
        title: 'Rhymes',
        titleColour: red,
        list: rhymes.isEmpty
            //if rhymes list is empty, loading
            ? Align(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: LoadingCircle(color: red),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  itemBuilder: (context, index) =>
                      RhymeTile(rhyme: rhymes[index]),
                  itemCount: rhymes.length,
                ),
              ),
      );
    }

    return Container();
  }
}
