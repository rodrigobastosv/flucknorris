import 'package:flucknorris/joke.dart';
import 'package:flutter/material.dart';

class JokeFlavorCard extends StatelessWidget {
  final String jokeFlavor, imagePath;

  const JokeFlavorCard(this.jokeFlavor, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JokePage(jokeFlavor, imagePath)),
        );
      },
      leading: Hero(
        tag: imagePath,
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/$imagePath'),
        ),
      ),
      title: Text(jokeFlavor),
      subtitle: Text(jokeFlavor),
      trailing: Icon(Icons.play_arrow),
    ));
  }
}
