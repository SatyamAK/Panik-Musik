import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:panik_musik/components.dart';
import 'package:panik_musik/main.dart';
import 'package:rxdart/rxdart.dart';

class MediaState {
  final MediaItem? mediaItem;
  final Duration pos;
  MediaState(this.mediaItem, this.pos);
}

Stream<MediaState> get mediaStateStream =>
  Rx.combineLatest2<MediaItem?, Duration, MediaState>(
    audioHandler.mediaItem, 
    AudioService.position,
    (mediaItem, position) => MediaState(mediaItem, position)
  );

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
                  return Text(
                    mediaItem!.title,
                    style: Theme.of(context).textTheme.headline5,
                  );
                }),
            SizedBox(
              height: 8,
            ),
            StreamBuilder<MediaItem?>(
                stream: audioHandler.mediaItem,
                builder: (context, snapshot) {
                  final mediaItem = snapshot.data;
                  return Container(  
                    height: 480,
                    width: 320,
                    child: Image.network(mediaItem!.artUri!.toString())
                  );
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
            SizedBox(height: 8,),
            StreamBuilder<MediaState>(
              stream: mediaStateStream,
              builder: (context, snapshot){
                final mediaState = snapshot.data;
                print(mediaState?.mediaItem?.duration.toString());
                return SeekBar(
                  duration: mediaState?.mediaItem?.duration ?? Duration.zero, 
                  position: mediaState?.pos ?? Duration.zero,
                );
              }
            )
          ],
        ),
      )),
    );
  }
}
