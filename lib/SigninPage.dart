import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frbse_auth_new/Authentication.dart';
import 'SignUpPage.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Form(
        child: Column(
          children: <Widget>[
            Text("LOGIN PAGE!"),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Username', prefixIcon: Icon(Icons.email)),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: 'Password', prefixIcon: Icon(Icons.security)),
            ),
            RaisedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                },
                child: Text("Submit")),
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ));
                },
                child: Text("Create new")),
          ],
        ),
      ),
    ));
  }
}
