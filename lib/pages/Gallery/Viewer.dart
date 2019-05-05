import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
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

  void initState() {
    super.initState();
    if (widget._photo.is_video) {
      _controller = VideoPlayerController.network(
          'http://' + URL.padidehDomain + widget._photo.file);
      chewieController = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: 3.0 / 2.0,
        autoPlay: true,
        looping: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _visibility = !_visibility;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                width: widget._deviceSize.width,
                height: widget._deviceSize.height,
                alignment: Alignment.center,
                child: widget._photo.is_video
                    ? Container()
                    : CircularProgressIndicator(),
              ),
              Hero(
                // using the photograph photo url itself as a tag
                tag: this.widget._photo.file,
                child: widget._photo.is_video
                    ? Chewie(
                        controller: chewieController,
                      )
                    : Image.network(
                        'http://' + URL.padidehDomain + widget._photo.file,
                        fit: BoxFit.contain,
                      ),
              ),
              Positioned(
                bottom: 0,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: _visibility ? 1.0 : 0.0,
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
                    alignment: Alignment.topRight,
                    height: widget._deviceSize.height / 4.0,
                    width: widget._deviceSize.width,
                    child: ListView(
                      children: <Widget>[
                        Text(
                          widget._photo.content,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
