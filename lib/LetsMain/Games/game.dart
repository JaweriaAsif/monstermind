import 'package:flutter/material.dart';
import 'package:monstermind/avatar.dart';

class Game extends StatelessWidget {
  const Game({Key? key, required this.question, required this.list})
      : super(key: key);

  final String question;
  final Widget list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8DA6B),
      body: Column(
        children: [
          AvatarAppbar(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0.8, -0.5),
                  child: IconButton(
                    onPressed: () {
                      //add audio
                    },
                    icon: Icon(Icons.keyboard_voice_rounded),
                    color: Colors.white,
                    iconSize: 50,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 3) * 2.2,
                  //  height: (MediaQuery.of(context).size.height / 3) * 2,
                  child: Stack(children: [
                    Image(
                      image: AssetImage('assets/images/speechbubble.png'),
                    ),
                    Column(children: [
                      SizedBox(height: 35),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          SizedBox(
                            width: 250,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                question,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xffF1B111),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ]),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 150,
                    child: Image(
                      image: AssetImage('assets/images/aloo.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Expanded(child: list),
        ],
      ),
    );
  }
}
