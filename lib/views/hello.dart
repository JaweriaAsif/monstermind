import 'package:flutter/material.dart';
import 'package:monstermind/controllers/userController.dart';
import 'package:monstermind/views/HomePage/homePage.dart';
import 'package:monstermind/views/signup2.dart';
import 'dart:async';

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
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
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: InkWell(
            onTap: () {
              isTapped = true;
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const Image(
                    image: AssetImage('assets/images/Username.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: const Alignment(0.09, -0.18),
                  child: Text(
                    "Hello, \n${user.name}!",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2EADB5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
