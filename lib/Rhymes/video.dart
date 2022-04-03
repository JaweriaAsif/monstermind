import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monstermind/Rhymes/rhymesMain.dart';
import 'package:monstermind/avatar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  // late YoutubePlayerController _controller;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _controller = YoutubePlayerController(
  //     initialVideoId: "BIvpZ4PPrx0",
  //     flags: YoutubePlayerFlags(
  //       autoPlay: false,
  //       mute: false,
  //     ),
  //   );
  //   super.initState();
  // }

  late VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    controller = VideoPlayerController.asset('assets/videos/video.mp4');
    controller.initialize().then((value) {
      setState(() {});
    });

    //make landscape
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    //back button function
    return WillPopScope(
      onWillPop: () async {
        //set potrait
        await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Image(
                image: AssetImage('assets/images/rhyme.png'),
                fit: BoxFit.fill,
              ),
            ),
            AvatarAppbar(
              onBack: () async {
                await SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp
                ]);
                Navigator.pop(context);
              },
            ),
            AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),

            // SizedBox(
            //   width: 400,
            //   child: YoutubePlayer(
            //     controller: YoutubePlayerController(
            //       initialVideoId: 'BIvpZ4PPrx0', //Add videoID.
            //       flags: YoutubePlayerFlags(
            //         hideControls: false,
            //         controlsVisibleAtStart: true,
            //         autoPlay: false,
            //         mute: false,
            //       ),
            //     ),
            //     // showVideoProgressIndicator: true,
            //     // progressIndicatorColor: AppColors.primary,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
