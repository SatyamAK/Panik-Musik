import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:panik_musik/main.dart';
import 'package:panik_musik/models/song.dart';
import 'package:panik_musik/screens/player/audioPlayer.dart';

class SongList extends StatefulWidget {
  final List<Song> songs;
  final String? title;
  const SongList({required this.songs, this.title});
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  List<Song> song = [];
  @override
  void initState() {
    widget.songs.forEach((element) {
      if (element.franchise == widget.title || element.artist == widget.title) {
        song.add(element);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title!)),
      body: ListView.builder(
        itemCount: song.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Container(child: Image.network(song[index].cover!)),
            title: Text(song[index].title!),
            subtitle: Text(song[index].artist!),
            onTap: () async {
              MediaItem mediaItem = MediaItem(
                  id: song[index].music!,
                  title: song[index].title!,
                  artUri: Uri.parse(song[index].cover!),
                  artist: song[index].artist!,
                  duration: Duration(milliseconds: int.parse(song[index].duration!)));
              await audioHandler.playMediaItem(mediaItem);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AudioPlayerScreen()));
            },
          );
        },
      ),
    );
  }
}
