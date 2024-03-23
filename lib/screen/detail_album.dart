import 'package:flutter/material.dart';
import 'package:kuis_123210005/screen/top_album.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailAlbum extends StatelessWidget {
  const DetailAlbum({super.key, required this.album});
  final TopAlbum album;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.albumName),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                _launchURL(album.albumurl);
              },
              icon: Icon(Icons.share)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              child: Image.network(album.imageUrls),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  album.albumName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(album.singer),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today),
                    Text(album.releaseDate),
                    Text(" | "),
                    Icon(Icons.home),
                    Text(album.source)
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text("Song List"),
              color: Colors.lightGreen,
              padding: EdgeInsets.all(20),
              width: MediaQuery.sizeOf(context).width,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text((index + 1).toString() + ". "),
                          Text(album.songs[index])
                        ],
                      ),
                    ),
                    // child: Text(index.toString()),
                  );
                },
                itemCount: album.songs.length,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    launchUrl(Uri.parse(url));
  } else {
    throw 'Error Cannot Launch $url';
  }
}
