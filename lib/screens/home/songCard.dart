import 'package:flutter/material.dart';

class SongCard extends StatelessWidget{
  final String? title;
  final String? img;
  const SongCard({
    this.title,
    this.img
  });

  @override 
  Widget build(BuildContext context){
    return Container(
      height: 250,
      width: 150,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container( 
              padding: EdgeInsets.only(right: 8, left: 8),
              height: 180,
              width: 130,
              color: Colors.transparent,
              child: Image.network(
                img!,
                fit: BoxFit.fill,
              )
            ),
            SizedBox(height:8),
            Text(title!, softWrap: true, textAlign: TextAlign.center,)
          ]
        )
      ),
    );
  }
}