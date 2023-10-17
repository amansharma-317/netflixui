import 'package:flutter/material.dart';
import 'package:netflix_ui/models/episode_model.dart';
import 'package:netflix_ui/screens/episodes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: EpisodesScreen(title: 'Rick and Morty', description: 'They are back...and right where we left \'em. Without a portal gun, Rick and Morty are stranded as they float through space in the ruins of the Citadel.',
          numberOfEpisodes: 4, episodes: episodes),
    );
  }
}

