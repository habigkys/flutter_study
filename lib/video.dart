import 'package:flutter/material.dart';
import 'package:imitate_sirloin/appbar/baseappbar.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final String videoUrl;

  Video({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video>{
  late VideoPlayerController _controller;
  late Future<void> _initializedController;

  @override
  void initState(){
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializedController = _controller.initialize();
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializedController,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  if(_controller.value.isPlaying){
                    _controller.pause();
                  }else{
                    _controller.play();
                  }
                });
              },
              child: VideoPlayer(_controller),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}