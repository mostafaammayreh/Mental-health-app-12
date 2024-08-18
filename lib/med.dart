import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoScreen extends StatefulWidget {
  @override
  _YouTubeVideoScreenState createState() => _YouTubeVideoScreenState();
}
//The createState method is overridden to create an instance of the _YouTubeVideoScreenState class.

class _YouTubeVideoScreenState extends State<YouTubeVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // the video ID below with the ID of the YouTube video I want to play
    _controller = YoutubePlayerController(
      initialVideoId: 'z0GtmPnqAd8',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Video'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              progressColors: ProgressBarColors(
                playedColor: Colors.blue,
                handleColor: Colors.blueAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Guided Meditation with Music '
                'Preparation: '
                'Find a Comfortable Space: Choose a quiet place where you wont be disturbed. Sit or lie down in a comfortable position'
                'Select Music: Choose soothing, instrumental music. Avoid music with lyrics. Nature sounds, ambient music, or classical pieces work well. Set the volume to a low, calming level.'
                'Begin the Meditation:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            // 
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Gradually Return:Begin to bring your awareness back to your physical surroundings.Wiggle your fingers and toes, gently stretch your body.Take a few more deep breaths, feeling the sense of calm and relaxation remaining with you.          ',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<YoutubePlayerController>(
        '_controller', _controller));
  }
}
