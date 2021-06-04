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

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {

  _backgroundTaskEntrypoint() {
    AudioServiceBackground.run(() => AudioController());
  }
  
  /*Future<void> playonEnter() async{
    if(AudioService.running){
      await AudioService.playFromMediaId(widget.id);
    }
    else{
      await AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);
      await AudioService.playFromMediaId(widget.id);
    }
  }*/
  /*@override
  void initState(){
    AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);
    super.initState();
  }*/
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
              onPressed: ()async{
                AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);
              },
              child: Text('Start'),
            ):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 640,
                  width: 480,
                  color: Colors.red,
                  //child: /*Image.network('')*/ 
                ),
                SizedBox(height:24),
                if(state.data.playing)
                  ElevatedButton(  
                    onPressed: pause(),
                    child: Text('pause'),
                  )
                else 
                  ElevatedButton(  
                    onPressed: play(),
                    child: Text('Play'),
                  )
              ],
            );
          },
        )
      ),
    );
  }

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