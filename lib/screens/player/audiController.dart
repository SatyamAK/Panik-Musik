import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends BackgroundAudioTask{
  final _audioPlayer = AudioPlayer();

  @override 
  onStart(Map<String, dynamic> params) async {
    AudioServiceBackground.setState(
      controls: [MediaControl.pause],
      playing: true,
      processingState: AudioProcessingState.connecting
    );
    _audioPlayer.processingStateStream.listen((event) {
      switch(event){
        case ProcessingState.idle:
          // ignore: todo
          // TODO: Handle this case.
          break;
        case ProcessingState.loading:
          // ignore: todo
          // TODO: Handle this case.
          break;
        case ProcessingState.buffering:
          // ignore: todo
          // TODO: Handle this case.
          break;
        case ProcessingState.ready:
          // ignore: todo
          // TODO: Handle this case.
          break;
        case ProcessingState.completed:
          onStop();
          break;
      }
    });
  }

  @override 
  Future<void> onStop() async{
    _audioPlayer.stop();
    AudioServiceBackground.setState(
      controls: [],
      playing: false,
      processingState: AudioProcessingState.stopped
    );
    super.onStop();
  }

  @override 
  Future<void> onPause() async{
    AudioServiceBackground.setState(
      controls: [MediaControl.play],
      playing: false,
      processingState: AudioProcessingState.ready
    );
    await _audioPlayer.pause();
  }

  @override 
  Future<void> onPlay() async{
    AudioServiceBackground.setState(
      controls: [MediaControl.pause],
      playing: true,
      processingState: AudioProcessingState.ready
    );
    await _audioPlayer.play();
  }

  @override 
  Future<void> onPlayMediaItem(MediaItem mediaItem) async{
    await _audioPlayer.setUrl(mediaItem.id);
    await AudioServiceBackground.setMediaItem(mediaItem);
    await _audioPlayer.play();
    AudioServiceBackground.setState(
      controls: [MediaControl.pause],
      playing: true,
      processingState: AudioProcessingState.ready
    );
  }
}