import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:just_audio/just_audio.dart';
import 'package:monstermind/controllers/googleSignIn.dart';
import 'package:monstermind/controllers/pointsProvider.dart';
import 'package:monstermind/controllers/userController.dart';
import 'package:monstermind/controllers/firebaseFunctions.dart';
import 'package:monstermind/views/Main&SignUp/hello.dart';
import 'package:monstermind/views/Main&SignUp/signup1.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool isTapped = false;
  late AudioPlayer player;

  bool reverse = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  GoogleSignInAccount? currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //google sign in

    signIn();
    googleSignIn.signInSilently();

    //animation and sound

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    final _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _animation =
        Tween<double>(begin: 0.55, end: 0.45).animate(_curvedAnimation);
    _animation.addListener(() {
      setState(() {});
    });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _controller.repeat(reverse: true);
        _controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();

    startTime();
    player = AudioPlayer();
    playSound();

    //TO REMOVE: temp DB function
    addToDB();
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    _controller.dispose();
    super.dispose();
  }

  startTime() async {
    var duration = const Duration(seconds: 10);
    return Timer(duration, route);
  }

  route() {
    GoogleSign().handleNavigation1(context);
  }

  playSound() async {
    await player.setAsset('assets/audios/all.mp3');
    player.setLoopMode(LoopMode.all);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    // print("Signed in: ${user.email}");
    // context.watch<PointsProvider>().getPointsDB();
    super.build(context);
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            //image
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Image(
                image: AssetImage('assets/images/main page.png'),
                fit: BoxFit.fill,
              ),
            ),

            //text
            const Align(
              alignment: Alignment(0, 0),
              child: Image(
                height: 170,
                image: AssetImage('assets/images/mm white.png'),
                fit: BoxFit.fill,
              ),
            ),

            // Transform.translate(
            //offset: Offset(
            // 0.76 * MediaQuery.of(context).size.width, _animation.value),
            Align(
              alignment: Alignment(0.94, _animation.value),
              child: const Image(
                height: 85,
                width: 90,
                image: AssetImage('assets/images/baby.png'),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  signIn() async {
    await googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) {
      setState(() async {
        currentUser = account;

        print("$currentUser Signed In!");
        print("Signed in: ${googleSignIn.currentUser!.email}");

        await UserController().getFromDB(googleSignIn.currentUser!.email);
        print("Signed in: ${user.name}");

        // print("${user.name}'s points: ${user.points}");
      });
    });

    // print("Signed in below: ${user.email}");
  }
}
