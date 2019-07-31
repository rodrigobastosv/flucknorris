import 'package:flucknorris/usuario.dart';
import 'package:flutter/material.dart';

import './joke-flavor-card.dart';
import 'gs_combobox.dart';

class HomePage extends StatelessWidget {
  static final List<Usuario> values = <Usuario>[
    Usuario(1, 'Teste', 'Teste', 'Testeqqqqqq', 'a'),
    Usuario(2, 'Teste2', 'Teste2', 'Teste2wwwww', 'a'),
    Usuario(3, 'Teste3', 'Teste3', 'Teste3eeee', 'a'),
    Usuario(4, 'Teste4', 'Teste4', 'Teste4rrrr', 'a'),
  ];

  final a = GSCombobox(firstSelected: true, labelText: 'aaaaa', itemBuilder: (Usuario u) {
    Color c = u.nome == 'Teste' ? Color.fromRGBO(5, 3, 9, 0.5) : Color.fromRGBO(55, 79, 119, 0.5);
    return Container(color: c, child: Row(children: <Widget>[
      CircleAvatar(
        backgroundImage: AssetImage('assets/chuck.jpg'),
      ),
      Text(u.nome)
    ],),);
  });

  void onChanged() {
    Usuario u = a.getSelectedValue();
    print(u);
  }

  @override
  Widget build(BuildContext context) {
    a.setValues(values);
    a.setOnChanged(onChanged);

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
      body: Column(
        children: <Widget>[
          a,
          RaisedButton(onPressed: () {
            print(a.getSelectedValue());
          },)
        ],
      ),
    );
  }
}
