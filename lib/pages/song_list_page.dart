import 'package:flutter/material.dart';
import 'package:panik_musik/models/song.dart';

class SongListPage extends StatelessWidget {
  final String? name;
  final List<Song> songs;
  const SongListPage(
    this.name, this.songs, {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name!),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index){
          return SizedBox(
            child: ListTile(
              leading: Container(   
                height: 42,
                width: 30,
                margin: const EdgeInsets.all(8),
                child: Image.network(
                  songs[index].cover!,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(songs[index].title!),
              subtitle: Text(songs[index].franchise!, style: Theme.of(context).textTheme.subtitle1,),
            ),
          );
        }
      ),
    );
  }
}