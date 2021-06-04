import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends BackgroundAudioTask{
  final _audioPlayer = AudioPlayer();

  @override 
  onStart(Map<String, dynamic> params) async {
    AudioServiceBackground.setState(
      controls: [MediaControl.pause, MediaControl.stop],
      playing: true,
      processingState: AudioProcessingState.connecting
    );
    print('hello');
    await _audioPlayer.setUrl("https://firebasestorage.googleapis.com/v0/b/panik-musik-f613c.appspot.com/o/KANA-BOON%20-%20Silhouette.mp3?alt=media&token=50fef160-0ad1-4f74-85e6-c3dae4947a39");
    _audioPlayer.play();
    AudioServiceBackground.setState(
        controls: [MediaControl.pause, MediaControl.stop],
        playing: true,
        processingState: AudioProcessingState.ready);
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
      controls: [MediaControl.play, MediaControl.stop],
      playing: false,
      processingState: AudioProcessingState.ready
    );
    await _audioPlayer.pause();
  }

  @override 
  Future<void> onPlay() async{
    AudioServiceBackground.setState(
      controls: [MediaControl.pause, MediaControl.stop],
      playing: true,
      processingState: AudioProcessingState.ready
    );
    await _audioPlayer.play();
  }

  @override 
  Future<void> onPlayFromMediaId(String mediaId) async{
    await _audioPlayer.setUrl(mediaId);
    await _audioPlayer.play();
  }
}