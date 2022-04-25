import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spring/spring.dart';

class Option extends StatefulWidget {
  const Option({
    Key? key,
    required this.path,
    required this.color,
    required this.text,
    required this.ontap,
    required this.audioPath,
  }) : super(key: key);

  final String path;
  final String text;
  final Color color;
  final Function() ontap;
  final String audioPath;

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AudioPlayer player;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player = AudioPlayer();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    final _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.15).animate(_curvedAnimation);
    _animation.addListener(() {
      setState(() {});
    });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    //_controller.forward();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
    _controller.dispose();
  }

  playSound() async {
    await player.setAsset(widget.audioPath);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //monster
          // Spring.bubbleButton(
          // child:

          InkWell(
            child: SizedBox(
              height: 130 * _animation.value,
              width: 130 * _animation.value,
              child: Image(
                image: AssetImage(widget.path),
                fit: BoxFit.fill,
              ),
            ),
            onTap: () {
              _controller.forward();
              playSound();
            },
            //   animDuration: Duration(milliseconds: 1500), //def=500m mil
            //   bubbleStart: .8, //def=0.0
            //   bubbleEnd: .9, //def=1.1
            //   animStatus: (AnimStatus status) {
            //     print(status);
            //   },
            //   curve: Curves.linear, //Curves.elasticOut
            //   delay: Duration(milliseconds: 0), //def=0
          ),

          const SizedBox(
            width: 5,
          ),

          //card
          InkWell(
            child: SizedBox(
              width: 180,
              height: 110,
              child: Card(
                color: Colors.white,
                child: Align(
                  child: Text(
                    "Let's ${widget.text}!",
                    style: TextStyle(
                        color: widget.color,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            ),

            //todo
            onTap: widget.ontap,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
