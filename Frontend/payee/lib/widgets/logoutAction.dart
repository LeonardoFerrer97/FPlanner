import 'package:flutter/material.dart';

class LogoutAction extends StatelessWidget {
  final logoutAction;
  LogoutAction(this.logoutAction);

  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: new Icon(Icons.exit_to_app),
        highlightColor: Colors.green[50],
        onPressed: (){logoutAction();},
      );
  }
}