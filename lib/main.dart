import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/games/questions.dart';
import 'package:monstermind/controllers/ryhmesProvider.dart';
import 'package:monstermind/controllers/pointsProvider.dart';
import 'package:monstermind/controllers/userController.dart';
import 'package:monstermind/views/mainPage.dart';
import 'package:provider/provider.dart';
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
          ChangeNotifierProvider(create: (_) => Questions()),
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
