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
          'lib/images/Payee.png',
          fit: BoxFit.none,
        ),

        SizedBox(height: 200),
        RaisedButton(

          padding: const EdgeInsets.only(top: 10.0,left: 30.0,right:30.0,bottom:10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
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
