import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:panik_musik/components/buttons.dart';
import 'package:panik_musik/main.dart';

class AudioPlayerPage extends StatelessWidget {
  const AudioPlayerPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MediaItem?>(
      stream: audioHandler.mediaItem,
      builder: (context, snapshot) {
        final mediaItem = snapshot.data;
        return Scaffold(
          appBar: AppBar(  
            title: Text(mediaItem?.title ?? ''),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 480,
                  width: 400,
                  child: mediaItem?.artUri != null?Image.network(mediaItem!.artUri.toString()): 
                    const CircularProgressIndicator(),
                ),
                StreamBuilder<bool>(
                  stream: audioHandler.playbackState.map((event) => event.playing),
                  builder: (context, snapshot){
                    final playing = snapshot.data??false;
                    if(playing){
                      return mediabutton(Icons.pause, audioHandler.pause, context);
                    }
                    return mediabutton(Icons.play_arrow, audioHandler.play, context);
                  }
                )
              ],
            ),
          ),
        );
      }
    );
  }
}