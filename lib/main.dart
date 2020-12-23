import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frbse_auth_new/Authentication.dart';
// import 'package:frbse_auth_new/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:frbse_auth_new/HomePage.dart';
import 'package:frbse_auth_new/SigninPage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //for any firebase action
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        title: 'Flutter demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
        
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    //firebase user can be 2 types
    //null or valid user
    if (firebaseUser != null) {
      return HomePage();
    }
    return SignIn();
  }
}

