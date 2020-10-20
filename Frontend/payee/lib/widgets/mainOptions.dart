import 'package:flutter/material.dart';

import 'mainOptions.i18n.dart';
class MainOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height:130),
          RaisedButton(
            padding: const EdgeInsets.only(top: 40.0,left: 30.0,right:30.0,bottom:40.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: const Color(0xff724E91),
            textColor: Colors.white,
            onPressed: () {
            },
            child: Text('Fazer um registro'.i18n),
        ),
        SizedBox(height:80),
         RaisedButton(
            padding: const EdgeInsets.only(top: 40.0,left: 50.0,right:50.0,bottom:40.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: const Color(0xff724E91),
            textColor: Colors.white,
            onPressed: () {
            },
            child: Text('Consultar'.i18n),
        ),
      ]
    );

  }
}