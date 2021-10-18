import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends BaseAudioHandler with QueueHandler, SeekHandler {
  final _player = AudioPlayer();
  var _playlist = ConcatenatingAudioSource(children: []);

  Future loadEmptyPlayList() async {
    try {
      await _player.setAudioSource(_playlist);
    } catch (err) {
      print(err);
    }
  }

  AudioController() {
    loadEmptyPlayList();
    _listenForCurrentSongIndexChanges();
  }

  @override
  Future<void> play() async {
    playbackState.add(playbackState.value
        .copyWith(playing: true, controls: [MediaControl.play]));
    await _player.play();
  }

  @override
  Future<void> pause() async {
    playbackState.add(playbackState.value
        .copyWith(playing: false, controls: [MediaControl.pause]));
    await _player.pause();
  }

  @override
  Future<void> updateQueue(List<MediaItem> _mediaItems) async {
    await _playlist.clear();
    final _audioSources =
        _mediaItems.map((song) => AudioSource.uri(Uri.parse(song.id)));
    await _playlist.addAll(_audioSources.toList());
    queue.add(_mediaItems);
    mediaItem.add(_mediaItems[0]);
  }

  void _listenForCurrentSongIndexChanges() {
    _player.currentIndexStream.listen((index) {
      final playlist = queue.value;
      if (index == null || playlist.isEmpty) return;
      if (_player.shuffleModeEnabled) {
        index = _player.shuffleIndices![index];
      }
      mediaItem.add(playlist[index]);
    });
  }
}
