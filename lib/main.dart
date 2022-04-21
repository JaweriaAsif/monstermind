import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/models/firebaseFunctions.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';
import 'package:monstermind/views/Rhymes/ryhmesProvider.dart';
import 'package:monstermind/views/button.dart';
import 'package:monstermind/views/signup1.dart';
import 'package:monstermind/views/signup2.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spring/spring.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PointsProvider()),
          ChangeNotifierProvider(create: (_) => RhymesProvider()),
          ChangeNotifierProvider(create: (_) => CardContent()),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monster Mind',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MyHomePage(title: "Monster Mind"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTapped = false;
  late AudioPlayer player;
  final SpringController springController =
      SpringController(initialAnim: Motion.play);
  bool reverse = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
    player = AudioPlayer();
    playSound();

    //TO REMOVE: temp DB function
    addToDB();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  startTime() async {
    var duration = const Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    if (!isTapped) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SignUp1()));
    }
  }

  playSound() async {
    await player.setAsset('assets/audios/all.mp3');
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            isTapped = true;
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignUp1()),
            );
          },
          child: Stack(
            children: [
              //image
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Image(
                  image: AssetImage('assets/images/main page.png'),
                  fit: BoxFit.fill,
                ),
              ),
              //text
              const Align(
                alignment: Alignment(0, 0),
                child: Image(
                  height: 170,
                  image: AssetImage('assets/images/mm white.png'),
                  fit: BoxFit.fill,
                ),
              ),

              //jumping monster
              Spring.translate(
                beginOffset: const Offset(0, 0),
                endOffset: const Offset(0, -30),
                child: const Align(
                  alignment: Alignment(0.94, 0.55),
                  child: Image(
                    height: 90,
                    image: AssetImage('assets/images/baby.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                // curve: Curves.bounceInOut,
                delay: const Duration(milliseconds: 1500),
                animDuration: const Duration(milliseconds: 800),
                animStatus: (AnimStatus status) {
                  if (status == AnimStatus.completed) {
                    setState(() {
                      springController.play(
                        motion: Motion.reverse,
                        curve: Curves.bounceInOut,
                      );
                      Timer(const Duration(milliseconds: 800),
                          () => Motion.pause);
                    });
                  }

                  print("Status: $status");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
