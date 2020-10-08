import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.i18n.dart';

class Login extends StatelessWidget {
  final loginAction;
  final String loginError;
  final BuildContext context;
  const Login(this.loginAction, this.loginError,this.context);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'images/lake.jpeg',
          fit: BoxFit.none,
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          color: Colors.green[300],
          textColor: Colors.white,
          onPressed: () {
            loginAction();
          },
          child: Text('Entrar'.i18n),
        ),
      ],
    );
  }

}
