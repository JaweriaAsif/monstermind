import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MonsterBg extends StatefulWidget {
  const MonsterBg(
      {Key? key,
      required this.bgImgPath,
      required this.monsterImgPath,
      required this.audioPath})
      : super(key: key);

  final String monsterImgPath;
  final String bgImgPath;
  final String audioPath;

  @override
  State<MonsterBg> createState() => _MonsterBgState();
}

class _MonsterBgState extends State<MonsterBg>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AudioPlayer player;
  late AnimationController _controller;
  late Animation<double> _animation;
  playSound() async {
    await player.setAsset(widget.audioPath);
    player.play();
  }

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
    _animation = Tween<double>(begin: 1, end: 0.85).animate(_curvedAnimation);
    _animation.addListener(() {
      setState(() {});
    });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
    @override
    void dispose() {
      player.dispose();
      super.dispose();
      _controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image(
              image: AssetImage(widget.bgImgPath),
              fit: BoxFit.fill,
            ),
            Center(
              child: InkWell(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * _animation.value,
                  child: Image(
                    image: AssetImage(widget.monsterImgPath),
                    fit: BoxFit.fill,
                  ),
                ),
                onTap: () {
                  _controller.forward();
                  playSound();
                },
              ),
            ),
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
