import 'package:flutter/material.dart';
import 'package:music_player_pr_2/views/screens/homepage.dart';
import 'package:music_player_pr_2/views/screens/playpage.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'playing_page': (context) => const PlayPage(),
      },
    );
  }
}
