import 'package:flutter/material.dart';
import 'package:monstermind/HomePage/option.dart';
import 'package:monstermind/LetsMain/drawMain.dart';
import 'package:monstermind/LetsMain/learnMain.dart';
import 'package:monstermind/LetsMain/playMain.dart';
import 'package:monstermind/Rhymes/rhymesMain.dart';

import 'package:monstermind/avatar.dart';
import 'package:monstermind/hello.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Image(
                image: AssetImage('assets/images/main.png'),
                fit: BoxFit.fill,
              ),
            ),
            AvatarAppbar(
              back: false,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 190),
                Option(
                  path: 'assets/images/remi.png',
                  color: const Color(0xff8D64BF),
                  text: "Learn",
                  ontap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const LearnMain()),
                    );
                  },
                ),
                Option(
                  path: 'assets/images/crab.png',
                  color: const Color(0xffEE412A),
                  text: "Sing",
                  ontap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const RhymesMain()),
                    );
                  },
                ),
                Option(
                  path: 'assets/images/aloo.png',
                  color: const Color(0xffF1B111),
                  text: "Play",
                  ontap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const PlayMain()),
                    );
                  },
                ),
                Option(
                  path: 'assets/images/brocolli.png',
                  color: const Color(0xff8CAD25),
                  text: "Draw",
                  ontap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const DrawMain()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
