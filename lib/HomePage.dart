import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frbse_auth_new/Authentication.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Text(
                "This is the Home page",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              RaisedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Text("signout"),
              )
            ])));
  }
}
