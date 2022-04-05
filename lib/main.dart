import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monstermind/Points&Profile/pointsProvider.dart';
import 'package:monstermind/Rhymes/ryhmesProvider.dart';
import 'package:monstermind/button.dart';
import 'package:monstermind/signup1.dart';

import 'package:monstermind/signup2.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PointsProvider()),
          ChangeNotifierProvider(create: (_) => RhymesProvider()),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Image(
                  image: AssetImage('assets/images/front.png'),
                  fit: BoxFit.fill,
                ),
              ),
              const Align(
                alignment: Alignment(0, -0.15),
                child: Text(
                  "Monster\nMind",
                  style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'AlloyInk',
                    color:
                        Color(0xff12777D), //Color.fromARGB(255, 214, 252, 255),
                    shadows: [
                      Shadow(
                        // bottomLeft
                        offset: Offset(-1.5, -1.5),
                        color: Color(0xffabfbff),
                        blurRadius: 5,
                      ),
                      Shadow(
                        // bottomRight
                        offset: Offset(1, -1),
                        color: Color(0xff000000),
                        blurRadius: 0,
                      ),
                      Shadow(
                        // bottomRight
                        offset: Offset(1.5, -1.5),
                        color: Color(0xffabfbff),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
