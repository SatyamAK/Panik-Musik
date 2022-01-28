import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:panik_musik/main.dart';
import 'package:panik_musik/models/song.dart';
import 'package:panik_musik/pages/audioplayer_page.dart';

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
              onTap: () async{
                MediaItem mediaItem = MediaItem(
                  id: songs[index].music!,
                  title: songs[index].title!,
                  artUri: Uri.parse(songs[index].cover!)
                );
                await audioHandler.playMediaItem(mediaItem);
                Navigator.push(
                  context, MaterialPageRoute(builder: (contex)=> const AudioPlayerPage())
                );
              },
            ),
          );
        }
      ),
    );
  }
}