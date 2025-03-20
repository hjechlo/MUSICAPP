import 'package:flutter/material.dart';
import 'package:music_app/components/my_drawer.dart';
import 'package:music_app/models/playlist_provider.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  //get playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    //get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen:false);
  }

  //go to a song
  void goToSong(int songIndex){
    //update song index
    playlistProvider.currentSongIndex = songIndex;
    //navigate to song page
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => SongPage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text("P L A Y L I S T")),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //get playlist
          final List<Song> playlist = value.playlist;
          
          //return list view UI
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index){
              //get individual song
              final Song song = playlist[index];
              //return list title ui
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}