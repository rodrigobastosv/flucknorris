import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flucknorris/chuck_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JokePage extends StatelessWidget {
  String jokeFlavor;
  String imagePath;
  ChuckBloc bloc = BlocProvider.getBloc<ChuckBloc>();

  JokePage(String jokeFlavor, String imagePath) {
    this.jokeFlavor = jokeFlavor;
    this.imagePath = imagePath;
    fetchJoke();
  }

  void fetchJoke() async {
    final String category = jokeFlavor.toLowerCase();
    final response = await http
        .get('https://api.chucknorris.io/jokes/random?category=$category');

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      bloc.pushJoke(responseData['value']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('$jokeFlavor Jokes'),
          Hero(
            tag: imagePath,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/' + imagePath),
            ),
          ),
        ],
      )),
      body: Column(
        children: <Widget>[
          Container(
            child: Card(
                margin: EdgeInsets.all(15),
                elevation: 5.0,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(18.0),
                        child: _buildJokeWidget()),
                    SizedBox(
                      height: 4.0,
                    ),
                    _buildFetchJokeButton(),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildJokeWidget() {
    return StreamBuilder(
      stream: bloc.chuckObservable,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data,
            style: TextStyle(fontSize: 20.0),
          );
        }
        return CircularProgressIndicator(
          backgroundColor: Color.fromRGBO(255, 0, 0, 0.5),
        );
      },
    );
  }

  Widget _buildFetchJokeButton() {
    return Align(
      alignment: Alignment(0.9, -1.0),
      heightFactor: 0.5,
      child: FloatingActionButton(
        onPressed: () => fetchJoke(),
        child: Icon(Icons.repeat_one),
      ),
    );
  }
}
