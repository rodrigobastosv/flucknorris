import 'package:flucknorris/usuario.dart';
import 'package:flutter/material.dart';

import './joke-flavor-card.dart';
import 'gs_combobox.dart';

class HomePage extends StatelessWidget {
  static final List<Usuario> values = <Usuario>[
    Usuario(1, 'Teste', 'Teste', 'Teste', 'a'),
    Usuario(2, 'Teste2', 'Teste2', 'Teste2', 'a'),
    Usuario(3, 'Teste3', 'Teste3', 'Teste3', 'a'),
    Usuario(4, 'Teste4', 'Teste4', 'Teste4', 'a'),
  ];

  final a = GSCombobox(labelText: 'aaaaa');

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
      body: a,
    );
  }
}
