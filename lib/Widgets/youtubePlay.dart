import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as YTExplode;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';

class YoutubeVideo extends StatefulWidget {
  final String youtubeUrl;

  const YoutubeVideo(this.youtubeUrl, {Key? key}) : super(key: key);

  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late final YoutubePlayerController _controller;
  late final String videoId;
  late final Future<YTExplode.Video> _videoMetadataFuture;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        showLiveFullscreenButton: false,
      ),
    );
    _videoMetadataFuture = _fetchVideoMetadata();
  }

  Future<YTExplode.Video> _fetchVideoMetadata() async {
    final ytExplode = YTExplode.YoutubeExplode();
    final video = await ytExplode.videos.get(videoId);
    ytExplode.close();
    return video;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(videoId),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 1.0 &&
            !_controller.value.isFullScreen) {
          _controller.play();
        } else {
          _controller.pause();
        }
      },
      child: FutureBuilder<YTExplode.Video>(
        future: _videoMetadataFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final videoMetadata = snapshot.data!;
            return Container(
              height: 200,
              color: Colors.blue,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                topActions: <Widget>[
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      videoMetadata.title,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 18.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
                onReady: () {},
                onEnded: (data) {},
              ),
            );
          } else if (snapshot.hasError) {
            return const Text('Failed to load video');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
// class LazyYoutubeWidget extends StatefulWidget {
//   final String youtubeUrl;

//   const LazyYoutubeWidget({Key? key, required this.youtubeUrl})
//       : super(key: key);

//   @override
//   _LazyYoutubeWidgetState createState() => _LazyYoutubeWidgetState();
// }

// class _LazyYoutubeWidgetState extends State<LazyYoutubeWidget> {
//   late final YoutubePlayerController _controller;
//   late final String videoId;
//   late final Future<YTExplode.Video> _videoMetadataFuture;

//   @override
//   void initState() {
//     super.initState();
//     videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl)!;
//     _controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: false,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//         showLiveFullscreenButton: false,
//       ),
//     );
//     _videoMetadataFuture = _fetchVideoMetadata();
//   }

//   Future<YTExplode.Video> _fetchVideoMetadata() async {
//     final ytExplode = YTExplode.YoutubeExplode();
//     final video = await ytExplode.videos.get(videoId);
//     ytExplode.close();
//     return video;
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return VisibilityDetector(
//       key: Key(videoId),
//       onVisibilityChanged: (visibilityInfo) {
//         if (visibilityInfo.visibleFraction == 1.0 &&
//             !_controller.value.isFullScreen) {
//           _controller.play();
//         } else {
//           _controller.pause();
//         }
//       },
//       child: FutureBuilder<YTExplode.Video>(
//         future: _videoMetadataFuture,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final videoMetadata = snapshot.data!;
//             return Container(
//               height: MediaQuery.of(context).size.height * 0.4,
//               color: Colors.transparent,
//               child: YoutubePlayer(
//                 controller: _controller,
//                 showVideoProgressIndicator: true,
//                 progressIndicatorColor: Colors.blueAccent,
//                 topActions: <Widget>[
//                   const SizedBox(width: 8.0),
//                   Expanded(
//                     child: Text(
//                       videoMetadata.title,
//                       style: const TextStyle(
//                         color: Colors.amber,
//                         fontSize: 18.0,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                   ),
//                 ],
//                 onReady: () {},
//                 onEnded: (data) {},
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return const Text('Failed to load video');
//           } else {
//             return const CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
