import 'package:flutter/material.dart';
import 'package:panik_musik/models/song.dart';
import 'package:panik_musik/screens/home/songCard.dart';
import 'package:panik_musik/screens/player/songList.dart';

class SongCardList extends StatefulWidget{
  final List<Song> songs;
  final String ?filterType;
  const SongCardList({
    required this.songs,
    this.filterType
  });

  @override
  _SongCardListState createState() => _SongCardListState();
}

class _SongCardListState extends State<SongCardList> {

  List<String> titles = [];
  List<String> imgs = [];
  @override
  void initState(){
    if(widget.filterType=='anime'){
      widget.songs.forEach((element) {
        if(element.category=='anime'){
          titles.add(element.franchise!);
          imgs.add(element.cover!);
        }
      });
    }
    else if(widget.filterType=='video games'){
      widget.songs.forEach((element) {
        if(element.category=='video game'){
          titles.add(element.franchise!);
          imgs.add(element.cover!);
        }
      });
    }
    else if(widget.filterType=='artist'){
      widget.songs.forEach((element) {
        titles.add(element.artist!);
        imgs.add(element.artistImg!);
      });
    }
    titles = titles.toSet().toList();
    imgs = imgs.toSet().toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder:(BuildContext context, int index){
        return InkWell(
          onTap: (){
            Navigator.push
            (
              context,
               MaterialPageRoute(builder: (BuildContext context)=>SongList(songs: widget.songs, title:titles[index]))
            );
          },
          child: SongCard(
            title: titles[index],
            img: imgs[index],
          ),
        );
      }
    );
  }
}