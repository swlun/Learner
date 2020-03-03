import 'package:flutter/material.dart';
import 'package:learner/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        elevation: 0.0,
        title: Text('Sign in to Learn'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign in anonymous'),
          onPressed: () async {
            dynamic result = await _auth.signInAnonymous();
            if(result == null) {
              print('error signing in...');
            }
            else {
              print('signed in');
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
