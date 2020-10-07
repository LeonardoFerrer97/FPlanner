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
        RaisedButton(
          onPressed: () {
            loginAction();
          },
          child: Text('Entrar'.i18n),
        ),
      ],
    );
  }

}
