import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/views/Main&SignUp/button.dart';
import 'package:monstermind/views/Main&SignUp/mainPage.dart';

class Offline extends StatefulWidget {
  const Offline({Key? key}) : super(key: key);

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Stack(
                fit: StackFit.expand,
                children: const [
                  Image(
                    image: AssetImage('assets/images/offline.png'),
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Uh Oh!",
                    style: TextStyle(
                      fontSize: 40,
                      color: tezBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Looks like you're offline",
                    style: TextStyle(
                      fontSize: 20,
                      color: tezBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Btn(
                    text: "Reload",
                    height: 35,
                    font: 20,
                    color: halkaBlue, //maraGrey,
                    minWidth: 120,
                    onPress: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ),
                      );
                    },
                    alignment: const Alignment(0, 0.2),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
