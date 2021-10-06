import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:panik_musik/main.dart';

class MediaState {
  final MediaItem? mediaItem;
  final Duration pos;
  MediaState(this.mediaItem, this.pos);
}

IconButton _button(IconData iconData, VoidCallback onPressed) =>
    IconButton(onPressed: onPressed, icon: Icon(iconData), iconSize: 64,);

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<MediaItem?>(
                stream: audioHandler.mediaItem,
                builder: (context, snapshot) {
                  final mediaItem = snapshot.data;
                  return Text(mediaItem!.title);
                }),
            SizedBox(
              height: 8,
            ),
            StreamBuilder<MediaItem?>(
                stream: audioHandler.mediaItem,
                builder: (context, snapshot) {
                  final mediaItem = snapshot.data;
                  return Image.network(mediaItem!.artUri!.toString());
                }),
            SizedBox(
              height: 8,
            ),
            StreamBuilder<bool>(
                stream: audioHandler.playbackState
                    .map((event) => event.playing)
                    .distinct(),
                builder: (context, snapshot) {
                  final playing = snapshot.data ?? false;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (playing) _button(Icons.pause, audioHandler.pause)
                      else _button(Icons.play_arrow, audioHandler.play)
                    ],
                  );
                }),
          ],
        ),
      )),
    );
  }
}
