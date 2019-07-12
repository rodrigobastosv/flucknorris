import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import './home.dart';
import 'chuck_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: HomePage(),
      ),
      blocs: [
        Bloc((i) => ChuckBloc()),
      ],
    );
  }
}