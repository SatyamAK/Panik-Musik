import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends BaseAudioHandler with QueueHandler, SeekHandler {
  final _player = AudioPlayer();

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.fastForward,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }

  AudioController() {
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    _player.setAudioSource(AudioSource.uri(Uri.parse('_item.id')));
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> playMediaItem(MediaItem _mediaItem) async {
    mediaItem.add(_mediaItem);
    await _player.setAudioSource(AudioSource.uri(Uri.parse(_mediaItem.id)));
    await _player.setUrl(_mediaItem.id);
    await play();
    return super.playMediaItem(_mediaItem);
  }
}
