import 'package:flutter/material.dart';
import 'package:music_app/components/neu_box.dart';
import 'package:music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {

        // get playlist
        final playlist = value.playlist;

        //get current song
        final currentSong = playlist[value.currentSongIndex ?? 0];

        //return scaffold ui
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right:25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // back button
                    IconButton(
                      onPressed: () => Navigator.pop(context), 
                      icon: const Icon(Icons.arrow_back),
                    ),
              
                    //title
                    const Text("S O N G S"),
              
                    //menu button
                    IconButton(
                      onPressed: () {}, 
                      icon:const Icon(Icons.menu),
                    ),
              
                  ],
                ),

                const SizedBox(height: 25),
              
                //album artwork
                NeuBox(
                  child: Column(
                    children: [
                      //image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(currentSong.albumArtImagePath),
                      ),

                      //song and artist name
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //song and artist name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName, 
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    fontSize:20, 
                                  ),
                                ),
                                Text(currentSong.artistName),
                              ],
                            ),
                        
                          //heart icon
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),
              
                //song duration progress
                Column(
                  children: [
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.0),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //start time
                          Text("0:00"),
                      
                          //shuffle
                          Icon(Icons.shuffle),
                      
                          //repeat
                          Icon(Icons.repeat),
                      
                          //end time
                          Text("0:00"),
                        ],
                      ),
                    ),

                    //song duration progress
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: 
                          const RoundSliderThumbShape(enabledThumbRadius: 0),
                      ),
                      child: Slider(
                        min: 0,
                        max: 100,
                        value: 50, 
                        activeColor: Colors.green,
                        onChanged: (value) {},
                      ),
                    ),
                
                  ],
                ),

                const SizedBox(height: 10),
              
                //playback
                Row(
                  children: [
                    //skip previous
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),

                    const SizedBox(width: 25),

                    //play/pause
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: NeuBox(
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),

                    //skip forward
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: NeuBox(
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ),

                  ],
                ),
                
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}