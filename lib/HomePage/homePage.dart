import 'package:flutter/material.dart';
import 'package:monstermind/HomePage/option.dart';
import 'package:monstermind/avatar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: Avatar(),
      //     ),
      //   ],
      //   automaticallyImplyLeading: false,
      // ),
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
          Avatar(),
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
