import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/views/HomePage/option.dart';
import 'package:monstermind/views/LetsMain/drawMain.dart';
import 'package:monstermind/views/LetsMain/learnMain.dart';
import 'package:monstermind/views/LetsMain/playMain.dart';
import 'package:monstermind/views/Rhymes/rhymesMain.dart';
import 'package:monstermind/views/Points&Profile/avatar.dart';
import 'package:monstermind/views/exitDialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => showExitPopup(context),
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
                  color: darkPurple,
                  text: "Learn",
                  ontap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const LearnMain()),
                    );
                  },
                  audioPath: "assets/audios/m1.mp3",
                ),
                Option(
                  path: 'assets/images/crab.png',
                  color: red,
                  text: "Sing",
                  ontap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const RhymesMain()),
                    );
                  },
                  audioPath: "assets/audios/m4.mp3",
                ),
                Option(
                  path: 'assets/images/aloo.png',
                  color: darkYellow,
                  text: "Play",
                  ontap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const PlayMain()),
                    );
                  },
                  audioPath: "assets/audios/m3.mp3",
                ),
                Option(
                  path: 'assets/images/brocolli.png',
                  color: green,
                  text: "Draw",
                  ontap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const DrawMain()),
                    );
                  },
                  audioPath: "assets/audios/m2.mp3",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
