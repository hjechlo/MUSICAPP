import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    //song 1
    Song(
      songName: "love.", 
      artistName: "wave to earth", 
      albumArtImagePath: "musicapp/cover/cover1v2.jpg", 
      audioPath: "musicapp/music/w2elove.mp3",
    ),
    //song 2
    Song(
      songName: "bad", 
      artistName: "wave to earth", 
      albumArtImagePath: "musicapp/cover/cover1v2.jpg", 
      audioPath: "musicapp/music/w2ebad.mp3",
    ),

    //song 3
    Song(
      songName: "evening glow", 
      artistName: "wave to earth", 
      albumArtImagePath: "musicapp/cover/cover1v2.jpg", 
      audioPath: "musicapp/music/w2eeveningglow.mp3",
    ),

    //song 4
    Song(
      songName: "black mountain", 
      artistName: "wave to earth", 
      albumArtImagePath: "musicapp/cover/cover2v2.JPG", 
      audioPath: "musicapp/music/w2eblackmountain.mp3",
    ),
  ];

  //current song playing index
  int? _currentSongIndex;
  /*
  
  G E T T E R S

  */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  /*
  
  S E T T E R S

  */

  set currentSongIndex(int? newIndex){
    //update current song index
    _currentSongIndex = newIndex;
    //update ui
    notifyListeners();
  }
}