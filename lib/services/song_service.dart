import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panik_musik/models/song.dart';

class SongService {
  final _songCollection = FirebaseFirestore.instance.collection('songs');

  Stream<QuerySnapshot?> getSongQueryStream() {
    return _songCollection.snapshots();
  }

  Map<String?, String?> getAnimeList(List<Song> allSongs) {
    Map<String?, String?> animeList = <String?, String?>{};
    for (Song song in allSongs) {
      if (song.category == "anime") {
        animeList[song.franchise] = song.cover;
      }
    }
    return animeList;
  }

  Map<String?, String?> getGamesList(List<Song> allSongs) {
    Map<String?, String?> gamesList = <String?, String?>{};
    for (Song song in allSongs) {
      if (song.category == "video game") {
        gamesList[song.franchise] = song.cover;
      }
    }
    return gamesList;
  }

  Map<String?, String?> getArtistList(List<Song> allSongs) {
    Map<String?, String?> artistList = <String?, String?>{};
    for (Song song in allSongs) {
      artistList[song.artist] = song.artistImg;
    }
    return artistList;
  }

  List<Song> getSongsforSelectedCriteria(
      List<Song> allSongs, String? filter, String? franchise) {
    List<Song> songsToBeReturned = [];

    if (filter == 'anime') {
      for (Song song in allSongs) {
        if (song.franchise == franchise) {
          songsToBeReturned.add(song);
        }
      }
      return songsToBeReturned;
    } else if (filter == 'video game') {
      for (Song song in allSongs) {
        if (song.franchise == franchise) {
          songsToBeReturned.add(song);
        }
      }
      return songsToBeReturned;
    } else {
      for (Song song in allSongs) {
        if (song.artist == franchise) {
          songsToBeReturned.add(song);
        }
      }
    }
    return songsToBeReturned;
  }
}
