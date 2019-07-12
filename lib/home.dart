import 'package:flutter/material.dart';

import './joke-flavor-card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/chuck.jpg'),
          ),
        ),
        title: Text('Fluck Norris Joke Teller'),
      ),
      body: ListView(
        children: const <Widget>[
          JokeFlavorCard('Animal', 'animals.webp'),
          JokeFlavorCard('Career', 'career.png'),
          JokeFlavorCard('Celebrity', 'celebrity.jpg'),
          JokeFlavorCard('Dev', 'dev.jpg'),
          JokeFlavorCard('Explicit', 'explicit.jpg'),
          JokeFlavorCard('Fashion', 'fashion.jpg'),
          JokeFlavorCard('Food', 'food.jpg'),
          JokeFlavorCard('History', 'history.jpg'),
          JokeFlavorCard('Money', 'money.jpg'),
          JokeFlavorCard('Movie', 'movie.jpg'),
          JokeFlavorCard('Music', 'music.png'),
          JokeFlavorCard('Political', 'political.jpg'),
          JokeFlavorCard('Religion', 'religion.png'),
          JokeFlavorCard('Science', 'science.jpg'),
          JokeFlavorCard('Sport', 'sport.jpg'),
          JokeFlavorCard('Travel', 'travel.jpg'),
        ],
      ),
    );
  }
}
