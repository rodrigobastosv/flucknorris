import 'package:flutter/material.dart';

class JokeFlavorCard extends StatelessWidget {
  final String _flavor;
  final String _imagePath;

  const JokeFlavorCard(this._flavor, this._imagePath);

  @override
  Widget build(BuildContext context) {
    print(_flavor);
    print(_imagePath);
    return Card(
        child: ListTile(
          onTap: () {
            print('teste');
          },
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/$_imagePath'),
      ),
      title: Text(_flavor),
      subtitle: Text(_flavor),
      trailing: Icon(Icons.play_arrow),
    ));
  }
}
