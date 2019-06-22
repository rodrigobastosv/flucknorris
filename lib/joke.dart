import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JokePage extends StatefulWidget {
  final String jokeFlavor;

  const JokePage(this.jokeFlavor);

  @override
  State<StatefulWidget> createState() {
    return JokePageState();
  }
}

class JokePageState extends State<JokePage> {
  String joke = '', jokeFlavor;
  bool isLoading = true;

  void fetchJoke() async {
    setState(() {
      isLoading = true;
    });
    final String category = jokeFlavor.toLowerCase();
    final response = await http
        .get('https://api.chucknorris.io/jokes/random?category=$category');

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      setState(() {
        isLoading = false;
        joke = responseData['value'];
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load joke');
    }
  }

  @override
  void initState() {
    super.initState();
    jokeFlavor = widget.jokeFlavor;
    fetchJoke();
  }

  Widget _buildJokeWidget() {
    return isLoading
        ? CircularProgressIndicator(backgroundColor: Color.fromRGBO(255, 0, 0, 0.5),)
        : Text(
            joke,
            style: TextStyle(fontSize: 20.0),
          );
  }

  Widget _buildChuckMencionWidget() {
    return isLoading
        ? Container()
        : Container(
            margin: EdgeInsets.only(left: 120.0),
            child: Text(
              'Chuck Norris',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          );
  }

  Widget _buildFetchJokeButton() {
    return isLoading
        ? Container()
        : Align(
            alignment: Alignment(0.9, -1.0),
            heightFactor: 0.5,
            child: FloatingActionButton(
              onPressed: () => fetchJoke(),
              child: Icon(Icons.repeat_one),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$jokeFlavor Jokes'),
      ),
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
                    _buildChuckMencionWidget(),
                    SizedBox(
                      height: 4.0,
                    ),
                    _buildFetchJokeButton(),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
