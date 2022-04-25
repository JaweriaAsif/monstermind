import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/ryhmesProvider.dart';
import 'package:monstermind/models/firebaseFunctions.dart';
import 'package:monstermind/views/Points&Profile/pointsProvider.dart';

import 'package:monstermind/views/button.dart';
import 'package:monstermind/views/signup1.dart';
import 'package:monstermind/views/signup2.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spring/spring.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:curved_animation_controller/curved_animation_controller.dart';

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
      home: const MyHomePage(title: "Monster Mind"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool isTapped = false;
  late AudioPlayer player;

  bool reverse = true;
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    final _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _animation =
        Tween<double>(begin: 0.55, end: 0.45).animate(_curvedAnimation);
    _animation.addListener(() {
      setState(() {});
    });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _controller.repeat(reverse: true);
        _controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();

    startTime();
    player = AudioPlayer();
    playSound();

    //TO REMOVE: temp DB function
    addToDB();
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    _controller.dispose();
    super.dispose();
  }

  startTime() async {
    var duration = const Duration(seconds: 10);
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
    player.setLoopMode(LoopMode.all);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
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

            // Transform.translate(
            //offset: Offset(
            // 0.76 * MediaQuery.of(context).size.width, _animation.value),
            Align(
              alignment: Alignment(0.94, _animation.value),
              child: const Image(
                height: 85,
                width: 90,
                image: AssetImage('assets/images/baby.png'),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
