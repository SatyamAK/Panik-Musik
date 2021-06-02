import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panik_musik/models/song.dart';

class SongService{
  final CollectionReference songCollection = FirebaseFirestore.instance.collection('songs');

  List<Song> songFromSnapShots(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map((e){
      return Song(
        title: e.get('title'),
        franchise: e.get('franchise'),
        category: e.get('category'),
        cover: e.get('cover'),
        artist: e.get('artist'),
        artistImg: e.get('artistImg'),
        music: e.get('music')
      );
    }).toList();
  }

  Stream<List<Song>> get songStream{
    return songCollection.snapshots().map((event) => songFromSnapShots(event));
  }
}