import 'package:flutter/material.dart';
import 'package:monstermind/avatar.dart';

class PicGame extends StatelessWidget {
  const PicGame(
      {Key? key,
      required this.question,
      required this.questionimagepath,
      required this.questionimagewidth,
      required this.list})
      : super(key: key);
  final String questionimagepath;
  final double questionimagewidth;
  final String question;
  final Widget list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCE79A),
      body: Column(
        children: [
          AvatarAppbar(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height / 3) * 1.45,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0.8, -0.7),
                  child: IconButton(
                    onPressed: () {
                      //add audio
                    },
                    icon: const Icon(Icons.volume_up_rounded),
                    color: Colors.white,
                    iconSize: 50,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 3) * 2.28,
                  child: Stack(children: [
                    const Image(
                      image: AssetImage('assets/images/speechbubble.png'),
                    ),
                    Column(children: [
                      const SizedBox(height: 74),
                      Row(
                        children: [
                          const SizedBox(width: 36),
                          SizedBox(
                            width: 235,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                question,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: const Color(0xffF1B111),
                                  fontSize: 25,
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
                const Align(
                  alignment: const Alignment(1, 0),
                  child: SizedBox(
                    width: 150,
                    child: Image(
                      image: AssetImage('assets/images/aloo.png'),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-0.5, 0.9),
                  child: SizedBox(
                    height: 200,
                    width: questionimagewidth,
                    child: Image(
                      image: AssetImage(questionimagepath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 30),
          Expanded(child: list),
        ],
      ),
    );
  }
}
