import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final logoutAction;
  Profile(this.logoutAction);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            logoutAction();
          },
          child: Text('Logout'),
        ),
      ],
    );
  }
}