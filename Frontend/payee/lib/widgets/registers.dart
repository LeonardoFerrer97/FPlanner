import 'package:flutter/material.dart';


import 'registers.i18n.dart';
class Registers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
          onPressed: () {
          },
          child: Text('Cadastrar um tipo de registro'.i18n),
        ),
         RaisedButton(
          onPressed: () {
          },
          child: Text('Fazer um registro'.i18n),
        ),
      ]
    );
  }
}