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
  Future<void> onPlayFromMediaId(String mediaId) async{
    await _audioPlayer.setUrl(mediaId);
    await _audioPlayer.play();
    AudioServiceBackground.setState(
      controls: [MediaControl.pause],
      playing: true,
      processingState: AudioProcessingState.ready
    );
  }
}