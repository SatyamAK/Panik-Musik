import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

class MediaState{ 
  final MediaItem? mediaItem;
  final Duration pos;
  MediaState(this.mediaItem, this.pos);
}

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(  
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //StreamBuilder<MediaItem?>(builder: builder)
            ],
          ),
        )
      ),
    );
  }
}
