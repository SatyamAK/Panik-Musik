import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerService extends BaseAudioHandler with SeekHandler {
  static final _item = MediaItem(
    id: 'https://firebasestorage.googleapis.com/v0/b/panik-musik-f613c.appspot.com/o/7!!%20-%20Lovers.mp3?alt=media&token=f576e434-27c0-4b4e-9f20-799582c222f6',
    album: "Naruto Shippuden",
    title: "Lovers",
    artist: "7!!",
    duration: const Duration(milliseconds: 228000),
    artUri: Uri.parse(
        'https://www.anime-planet.com/images/anime/covers/naruto-shippuden-1131.jpg'),
  );

  final _player = AudioPlayer();
  // ignore: non_constant_identifier_names
  AudioPlayerService() {
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    mediaItem.add(_item);
    _player.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
  }

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
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

  void updateCurrMediaItem(MediaItem _item) {
    mediaItem.add(_item);
  }

  // @override
  // Future<void> playMediaItem(MediaItem mediaItem) async {
  //   if (_player.playing) await _player.stop();
  //   updateCurrMediaItem(mediaItem);
  //   await _player.setAudioSource(AudioSource.uri(Uri.parse(mediaItem.id)));
  //   await _player.play();
  // }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();
}
