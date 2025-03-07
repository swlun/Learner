import 'package:flutter/material.dart';
import './register.dart';
import 'sign_In.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showRegister = true;
  void toggleView() {
    setState(() => showRegister = !showRegister);
  }

  @override
  Widget build(BuildContext context) {
    if(showRegister) {
      return Container(
        child: Register(toggleView: toggleView),
      );
    }
    else {
      return Container(
        child: SignIn(toggleView: toggleView),
      );
    }
  }
}
