import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/entity/photograph.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Viewer extends StatefulWidget {
  final PhotoEntityList _photo;
  final Size _deviceSize;

  Viewer(this._photo, this._deviceSize);

  @override
  ViewerState createState() {
    return new ViewerState();
  }
}

class ViewerState extends State<Viewer> {
  bool _visibility = true;
  VideoPlayerController _controller;
  ChewieController chewieController;
  bool _clicked;

  void initState() {
    _clicked = false;
    super.initState();
    if (widget._photo.is_video) {
      _controller = VideoPlayerController.network(widget._photo.file);
      chewieController = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: 3.0 / 2.0,
        autoPlay: false,
        looping: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _visibility = !_visibility;
                });
              },
              child: Hero(
                // using the photograph photo url itself as a tag
                tag: this.widget._photo.file,
                child: widget._photo.is_video
                    ? Chewie(
                        controller: chewieController,
                      )
                    : fadeInImage(),
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _visibility ? 1.0 : 0.0,
                child: Container(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
                  alignment: Alignment.topCenter,
                  height: widget._deviceSize.height / 4.0,
                  width: widget._deviceSize.width,
                  child: Text(
                    widget._photo.content,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//  Widget videoPlayer() {
//    return GestureDetector(
//      onTap: () {
//        setState(() {
//          _controller.value.isPlaying
//              ? _controller.pause()
//              : _controller.play();
//        });
//      },
//      child: Stack(alignment: Alignment.center, children: <Widget>[
//        _controller.value.initialized
//            ? AspectRatio(
//                aspectRatio: _controller.value.aspectRatio,
//                child: VideoPlayer(_controller),
//              )
//            : Container(),
//        AnimatedOpacity(
//          opacity: _clicked ? 1.0 : 0.0,
//          duration: Duration(microseconds: 400),
//          child: _controller.value.isPlaying
//              ? Icon(
//                  Icons.play_arrow,
//                  size: 25.0,
//                  color: Colors.white,
//                )
//              : Icon(
//                  Icons.pause,
//                  size: 25.0,
//                  color: Colors.white,
//                ),
//        )
//      ]),
//    );
//  }

  FadeInImage fadeInImage() {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/logo.png',
      image: this.widget._photo.file,
      fit: BoxFit.contain,
    );
  }
}
