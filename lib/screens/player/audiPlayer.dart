import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:panik_musik/models/song.dart';
import 'package:panik_musik/screens/player/audiController.dart';

class AudioPlayerScreen extends StatefulWidget{
  final String title;
  final Song song;
  const AudioPlayerScreen({
    this.title,
    this.song
  });

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

_backgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => AudioController());
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {

  MediaItem mediaItem;
  Future<void> playonEnter() async{
    mediaItem = MediaItem(  
      id: widget.song.music,
      artist: widget.song.artist,
      album: widget.song.franchise,
      title: widget.song.title,
      artUri: Uri.parse(widget.song.cover)
    );
    if(AudioService.running){
      if(AudioService.currentMediaItem.id==mediaItem.id){
        return ;
      }
      await AudioService.playMediaItem(mediaItem);
    }
    else{
      await AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);
      await AudioService.playMediaItem(mediaItem);
    }
  }
  @override
  void initState() {
    playonEnter();
    super.initState();
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: StreamBuilder<PlaybackState>(  
          stream: AudioService.playbackStateStream,
          builder: (context, state){
            return (state.data==null)?ElevatedButton(  
              onPressed: start,
              child: Text('Start'),
            ):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: 300,
                  child: Image.network(mediaItem.artUri.toString(), fit: BoxFit.fill,)
                ),
                SizedBox(height:24),
                Text('By '+mediaItem.artist, style: Theme.of(context).textTheme.bodyText2,),
                SizedBox(height:24),
                if(state.data.playing)
                  ElevatedButton(  
                    onPressed: pause,
                    child: Text('pause'),
                  )
                else 
                  ElevatedButton(  
                    onPressed: play,
                    child: Text('Play'),
                  )
              ],
            );
          },
        )
      ),
    );
  }

  start() => AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);

  play() async{
    if(AudioService.running){
      await AudioService.play();
    }
    else{
      mediaItem = MediaItem(  
        id: widget.song.music,
        artist: widget.song.artist,
        album: widget.song.franchise,
        title: widget.song.title,
        artUri: Uri.parse(widget.song.cover)
      );
      await AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);
      await AudioService.playMediaItem(mediaItem);
    }
  }

  pause() async{
    AudioService.pause();
  }
}