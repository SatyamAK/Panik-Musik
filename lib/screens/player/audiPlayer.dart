import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:panik_musik/screens/player/audiController.dart';

class AudioPlayerScreen extends StatefulWidget{
  final String title;
  final String id;
  const AudioPlayerScreen({
    this.title,
    this.id
  });

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

_backgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => AudioController());
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
 
  Future<void> playonEnter() async{
    if(AudioService.running){
      await AudioService.playFromMediaId(widget.id);
    }
    else{
      print('starting');
      await AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);
      await AudioService.playFromMediaId(widget.id);
    }
  }
  @override
  void initState(){
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
                  height: 320,
                  width: 320,
                  color: Colors.red,
                  //child: /*Image.network('')*/ 
                ),
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
      AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);
    }
  }

  pause() async{
    AudioService.pause();
  }
}