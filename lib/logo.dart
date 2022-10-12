import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notice_app/screens/home_screen.dart';
// import 'package:flutter_application_1/image.dart';
import 'package:video_player/video_player.dart';

// import 'clock.dart';
// import 'image.dart';

class logo extends StatefulWidget {
  const logo({Key? key}) : super(key: key);

  @override
  State<logo> createState() => _logoState();
}

class _logoState extends State<logo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });

    _controller = VideoPlayerController.asset('assets/images/123.mp4')
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(70.0);
    _playVideo();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playVideo() async {
    _controller.play();

    //  await Future.delayed(const Duration(seconds: 5));

    // Navigator.pushNamed(context, 'Homep');
  }

  // Within the `FirstRoute` widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                ),
              )
            : Container(),
      ),
    );
  }
}
