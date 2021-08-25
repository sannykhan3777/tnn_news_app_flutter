import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LiveNewsScreen extends StatefulWidget {
  final String url;

  LiveNewsScreen({@required this.url});

  @override
  _LiveNewsScreenState createState() => _LiveNewsScreenState();
}

class _LiveNewsScreenState extends State<LiveNewsScreen> {
  final FijkPlayer player = FijkPlayer();

  void setOrientation() {
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  _LiveNewsScreenState();

  @override
  void initState() {
    super.initState();
    setOrientation();
    player.setDataSource(widget.url, autoPlay: true);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: FijkView(
            player: player,
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom , SystemUiOverlay.top]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);
  }
}