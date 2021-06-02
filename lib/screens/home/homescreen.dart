import 'package:flutter/material.dart';
import 'package:panik_musik/models/song.dart';
import 'package:panik_musik/screens/home/songCardList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Song> songs = [
      Song(
        title: 'Shilloute',
        cover: 'https://m.media-amazon.com/images/M/MV5BZmQ5NGFiNWEtMmMyMC00MDdiLTg4YjktOGY5Yzc2MDUxMTE1XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg',
        category: 'anime',
        franchise: 'Naruto Shippuden',
        artist: 'KANABOON',
        artistImg: 'https://thisis-images.scdn.co/37i9dQZF1DZ06evO2eHcgr-default.jpg'
      ),
      Song(
        title: 'Spiral',
        cover: 'https://m.media-amazon.com/images/M/MV5BZmQ5NGFiNWEtMmMyMC00MDdiLTg4YjktOGY5Yzc2MDUxMTE1XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg',
        category: 'video game',
        franchise: 'Naruto Ultimate Ninja Storm 4',
        artist: 'KANABOON',
        artistImg: 'https://thisis-images.scdn.co/37i9dQZF1DZ06evO2eHcgr-default.jpg'
      ),
    ];

    return SingleChildScrollView(
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
          SizedBox(height:8),
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
          SizedBox(height:8),
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