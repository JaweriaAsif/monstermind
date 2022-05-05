import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monstermind/views/Rhymes/rhymesMain.dart';
import 'package:monstermind/views/Points&Profile/avatar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //landscape orientation
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

    //youtube controller
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        // hideControls: true,
      ),
    );
  }

  @override
  Future<void> dispose() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //back button function
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        //custom back button
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff1D9EA6),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          //background
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Image(
              image: AssetImage('assets/images/video bg.png'),
              fit: BoxFit.fill,
            ),
          ),

          //tv and video

          Stack(
            children: [
              //tv
              const Align(
                alignment: Alignment(-0.5, 0),
                child: Image(
                  width: 550,
                  image: AssetImage('assets/images/TV.png'),
                  fit: BoxFit.fill,
                ),
              ),

              //video

              Align(
                alignment: const Alignment(-0.46, -0.04),
                child: SizedBox(
                  height: 245,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: YoutubePlayer(
                        width: 400, controller: _controller, bottomActions: []),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
