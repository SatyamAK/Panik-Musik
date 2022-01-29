class Song {
  final String? artist;
  final String? artistImg;
  final String? category;
  final String? cover;
  final int? duration;
  final String? franchise;
  final String? music;
  final String? title;

  Song(
      {this.artist,
      this.artistImg,
      this.category,
      this.cover,
      this.duration,
      this.franchise,
      this.music,
      this.title});

  Song.fromJson(Map<String, Object?> object):this(
    artist : object['artist'] as String,
    artistImg : object['artistImg'] as String,
    category : object['category']as String,
    cover : object['cover']as String,
    duration : object['duration'] as int,
    franchise : object['franchise']as String,
    music : object['music']as String,
    title : object['title']as String
  );
}
