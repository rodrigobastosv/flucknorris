import 'package:flutter/material.dart';

import './joke-flavor-card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fluck Norris Joke Teller'),
      ),
      body: ListView(children: const <Widget>[
        JokeFlavorCard('Animals', 'b'),
        JokeFlavorCard('Career', 'b'),
        JokeFlavorCard('Celebrity', 'b'),
        JokeFlavorCard('Dev', 'b'),
        JokeFlavorCard('Explicit', 'b'),
        JokeFlavorCard('Fashion', 'b'),
        JokeFlavorCard('Food', 'b'),
        JokeFlavorCard('History', 'b'),
        JokeFlavorCard('Money', 'b'),
        JokeFlavorCard('Movie', 'b'),
        JokeFlavorCard('Music', 'b'),
        JokeFlavorCard('Political', 'b'),
        JokeFlavorCard('Religion', 'b'),
        JokeFlavorCard('Science', 'b'),
        JokeFlavorCard('Sport', 'b'),
        JokeFlavorCard('Travel', 'b'),
      ]),
    );
  }
}
