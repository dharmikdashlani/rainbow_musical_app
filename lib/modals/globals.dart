import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Globals {
  static Map<String,dynamic> playsong = {};
  static int index = 0;
  static List<Map<String, dynamic>> musicList = [
    {
      'images': const AssetImage('assets/images/hanumanchalisa.jpeg'),
      'song': 'assets/audio/hanumanchalisa.mp3',
      'song_name': "Hanuman Chalisa",
      'player': AssetsAudioPlayer(),
      'created_by': "Shekhar Ravjiani",
      'total_duration': Duration.zero,
      'color': Colors.lightBlueAccent,
    },
    {
      'images': const AssetImage('assets/images/undertheinfluence.jpeg'),
      'song': 'assets/audio/under the influence.mp3',
      'song_name': "Under The Influence",
      'player': AssetsAudioPlayer(),
      'created_by': "Chris Brown",
      'total_duration': Duration.zero,
      'color': Colors.deepPurpleAccent,
    },
    {
      'images': const AssetImage('assets/images/shivatheme.jpeg'),
      'song': 'assets/audio/shivatheme.mp3',
      'song_name': "Shiva Theme",
      'player': AssetsAudioPlayer(),
      'created_by': "Pritam,Javed Ali",
      'total_duration': Duration.zero,
      'color': Colors.orangeAccent,
    },
    {
      'images': const AssetImage('assets/images/deva.jpeg'),
      'song': 'assets/audio/deva.mp3',
      'song_name': "Deva Deva",
      'player': AssetsAudioPlayer(),
      'created_by': "Pritam,Arijit Singh",
      'total_duration': Duration.zero,
      'color': Colors.blue.shade900,
    },
    {
      'images': const AssetImage('assets/images/goosebumps.jpeg'),
      'song': 'assets/audio/goosebumps.mp3',
      'song_name': "Goosebumps - Remix",
      'player': AssetsAudioPlayer(),
      'created_by': "Travis Scott,HVME",
      'total_duration': Duration.zero,
      'color': Colors.white,
    },
    {
      'images': const AssetImage('assets/images/darkside.jpeg'),
      'song': 'assets/audio/darkside.mp3',
      'song_name': "DARKSIDE",
      'player': AssetsAudioPlayer(),
      'created_by': "Neoni",
      'total_duration': Duration.zero,
      'color': Colors.lightBlueAccent,
    },
    {
      'images': const AssetImage('assets/images/heatwaves.jpeg'),
      'song': 'assets/audio/heatwaves.mp3',
      'song_name': "Heat Waves",
      'player': AssetsAudioPlayer(),
      'created_by': "Glass Animals",
      'total_duration': Duration.zero,
      'color': Colors.pinkAccent,
    },
    {
      'images': const AssetImage('assets/images/starboy.jpeg'),
      'song': 'assets/audio/starboy.mp3',
      'song_name': "Starboy",
      'player': AssetsAudioPlayer(),
      'created_by': "The Weeknd, Daft Punk",
      'total_duration': Duration.zero,
      'color': Colors.red,
    },
    {
      'images': const AssetImage('assets/images/vardan.jpeg'),
      'song': 'assets/audio/vardan.mp3',
      'song_name': "Vardaan",
      'player': AssetsAudioPlayer(),
      'created_by': "Ajey Nagar, Wily Frenzy",
      'total_duration': Duration.zero,
      'color': Colors.greenAccent,
    },
    {
      'images': const AssetImage('assets/images/industrybaby.jpeg'),
      'song': 'assets/audio/industrybaby.mp3',
      'song_name': "INDUSTRY BABY",
      'player': AssetsAudioPlayer(),
      'created_by': "Jack Harlow",
      'total_duration': Duration.zero,
      'color': Colors.lightBlueAccent,
    },
  ];
}
