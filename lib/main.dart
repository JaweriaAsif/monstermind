import 'package:flutter/material.dart';
import 'package:monstermind/button.dart';
import 'package:monstermind/signup2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Stack(
              fit: StackFit.expand,
              children: const [
                Image(
                  image: AssetImage('assets/images/Sign up 1.png'),
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Btn(
              text: 'Sign Up',
              onPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Signup2()),
                );
              },
              alignment: const Alignment(0, 0.13),
            ),
          ],
        ),
      ),
    );
  }
}
