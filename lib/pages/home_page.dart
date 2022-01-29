import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panik_musik/components/cards.dart';
import 'package:panik_musik/models/song.dart';
import 'package:panik_musik/pages/song_list_page.dart';
import 'package:panik_musik/services/song_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuerySnapshot? _songCollection = Provider.of<QuerySnapshot?>(context);
    List<Song> songs = [];

    _songCollection?.docs.map((doc) => songs.add(
      Song(
        artist: doc.get('artist'),
        artistImg: doc.get('artistImg'),
        category: doc.get('category'),
        cover: doc.get('cover'),
        duration: int.parse(doc.get('duration')),
        franchise: doc.get('franchise'),
        music: doc.get('music'),
        title: doc.get('title')
      )
    )).toList();

    Map<String?, String?> animeList = SongService().getAnimeList(songs);
    List<String?> animeNames = animeList.keys.toList();

    Map<String?, String?> gameList = SongService().getGamesList(songs);
    List<String?> gameNames = gameList.keys.toList();

    Map<String?, String?> artistList = SongService().getArtistList(songs);
    List<String?> artistNames = artistList.keys.toList();

    void sendingSongs(String? category, String? franchise, BuildContext context){
      List<Song> songsToBeSent = SongService().getSongsforSelectedCriteria(songs, category, franchise);
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => SongListPage(franchise, songsToBeSent)
        )
      );
    }

    return SafeArea(
        child: (_songCollection==null)?const CircularProgressIndicator():SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Animes', style: Theme.of(context).textTheme.headline1),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: 200,
                child: ListView.builder(
                    itemCount: animeNames.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          sendingSongs('anime', animeNames[index], context);
                        },
                        child: collectionCard(
                            animeNames[index],
                            animeList[animeNames[index]],
                            context),
                      );
                    }
                  ),
              ),
            ),
            Text('Video Games', style: Theme.of(context).textTheme.headline1),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: 200,
                child: ListView.builder(
                    itemCount: gameNames.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap:(){
                          sendingSongs('video game', gameNames[index], context);
                        },
                        child: collectionCard(
                            gameNames[index],
                            gameList[gameNames[index]],
                            context),
                      );
                    }),
              ),
            ),
            Text('Artists', style: Theme.of(context).textTheme.headline1),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: 200,
                child: ListView.builder(
                    itemCount: artistNames.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          sendingSongs('artist', artistNames[index], context);
                        },
                        child: collectionCard(
                            artistNames[index],
                            artistList[artistNames[index]],
                            context),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
