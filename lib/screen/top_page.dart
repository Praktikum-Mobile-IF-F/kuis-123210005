import 'package:flutter/material.dart';
import 'package:kuis_123210005/screen/top_album.dart';

import 'detail_album.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Album"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            final TopAlbum album= topAlbumList[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailAlbum(album: album);
              }));
          },
          child: Card(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  // height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.network(album.imageUrls),
                ),
                // Text(album.albumName, textAlign: TextAlign.center,),
              ],
            ),
          ),
        );
    },
    itemCount: topAlbumList.length,
    ));
  }
}
