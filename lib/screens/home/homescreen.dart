import 'package:flutter/material.dart';
import 'package:panik_musik/models/song.dart';
import 'package:panik_musik/screens/home/songCardList.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Song> songs = Provider.of<List<Song>>(context);
    return (songs.length==0)?Center(child:CircularProgressIndicator()):SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal:12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:8),
          Text('Anime', style: Theme.of(context).textTheme.headline6,),
          SizedBox(height:8),
          Flexible(
            child: Container(
              height: 250,
              child: SongCardList(
                songs: songs,
                filterType: 'anime'
              ),
            ),
          ),
          SizedBox(height:12),
          Text('Video Games', style: Theme.of(context).textTheme.headline6,),
          SizedBox(height:8),
          Flexible(
            child: Container(
              height: 250,
              child: SongCardList(
                songs: songs,
                filterType: 'video games'
              ),
            ),
          ),
          SizedBox(height:12),
          Text('Artist', style: Theme.of(context).textTheme.headline6,),
          SizedBox(height:8),
          Flexible(
            child: Container(
              height: 250,
              child: SongCardList(
                songs: songs,
                filterType: 'artist'
              ),
            ),
          )
        ]
      )
    );
  }
}