import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/views/Points&Profile/avatar.dart';

class Game extends StatelessWidget {
  const Game(
      {Key? key,
      required this.question,
      required this.list,
      required this.onPressed})
      : super(key: key);

  final String question;
  final Widget list;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgYellow,
      body: Column(
        children: [
          AvatarAppbar(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height / 3) * 1,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0.8, -0.5),
                  child: IconButton(
                    onPressed: () {
                      onPressed();
                    },
                    icon: const Icon(Icons.volume_up_rounded),
                    color: Colors.white,
                    iconSize: 50,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 3) * 2.28,
                  // height: (MediaQuery.of(context).size.height / 3) * 0.8,
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
                                style: TextStyle(
                                  color: darkYellow,
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
          const SizedBox(height: 20),
          Expanded(child: list),
        ],
      ),
    );
  }
}
