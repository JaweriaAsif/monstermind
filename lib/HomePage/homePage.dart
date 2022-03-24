import 'package:flutter/material.dart';
import 'package:monstermind/HomePage/option.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 150,
              ),
              Option(
                path: 'assets/images/remi.png',
                color: Color(0xff8D64BF),
                text: "Learn",
              ),
              Option(
                path: 'assets/images/crab.png',
                color: Color(0xffEE412A),
                text: "Sing",
              ),
              Option(
                path: 'assets/images/aloo.png',
                color: Color(0xffF1B111),
                text: "Play",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
