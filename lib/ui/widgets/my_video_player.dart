import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netfix_moviedb/models/video_model.dart';
import 'package:netfix_moviedb/utils/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({ super.key, required this.video });
  final VideoModel video;

  @override
  State <MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  YoutubePlayerController? _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.video.key,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        hideThumbnail: true,
        mute: false,
        enableCaption: false 
      )
    );
  }

  @override
  void dispose() {
    _youtubePlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _youtubePlayerController == null
      ? Center(
        child: SpinKitFadingCircle(
          color: kPrimaryColor,
          size: 20,
        ),
      )
      : YoutubePlayer(
        controller: _youtubePlayerController!,
        progressColors: ProgressBarColors(
          handleColor: kPrimaryColor,
          playedColor: kPrimaryColor,
        ),
        onEnded: (YoutubeMetaData metaData) {
          _youtubePlayerController!.play();
          _youtubePlayerController!.pause();
        },
      );
  }
}