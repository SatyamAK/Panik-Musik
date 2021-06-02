import 'package:flutter/material.dart';
import 'package:panik_musik/models/song.dart';

class SongList extends StatefulWidget {
  final List<Song> songs;
  final String title;
  const SongList({
    this.songs,
    this.title
  });
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  List<Song> song =[];
  @override
  void initState(){
    widget.songs.forEach((element) {
      if(element.franchise==widget.title||element.artist==widget.title){
        song.add(element);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: ListView.builder(
        itemCount: song.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Container(
              child:Image.network(
                song[index].cover
              )
            ),
            title: Text(song[index].title),
            subtitle: Text(song[index].artist),
          );
        },  
      ),
    );
  }
}