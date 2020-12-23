import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'package:provider/provider.dart';
import 'SigninPage.dart';
// import 'package:firebase_auth/firebase_auth.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Form(
        child: Column(
          children: <Widget>[
            Text("SIGNUP PAGE."),
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
                  context.read<AuthenticationService>().signUp(
                        emailController.text,
                        passwordController.text,
                      );
                      // SignUpAuth();
                },
                child: Text('Create')),
          ],
        ),
      ),
    ));
  }
}

// class SignUpAuth extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {



//     final firebaseUser = context.watch<User>();

//     //firebase user can be 2 types
//     //null or valid user
//     if (firebaseUser != null) {
//       showDialog(context: context, builder:signupDialogBox(context),);
    
//     }
//      showDialog(context: context,builder:  signupErrorDialogBox(context),);
    
//     }
// }



signupDialogBox(BuildContext context) async {
  return AlertDialog(
    content: Container(
      child: Text("Signed Up"),
    ),
    actions: <Widget>[
      RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
          child: Text("Signed Up")),
    ],
  );
}


signupErrorDialogBox(BuildContext context) async {
  return AlertDialog(
    content: Container(
      child: Text("Error while signing in"),
    ),
    actions: <Widget>[
      RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: Text("Ok")),
    ],
  );
}
