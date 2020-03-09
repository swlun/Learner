import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learner/services/auth.dart';
import 'package:learner/shared/constants.dart';
import 'package:learner/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        title: Text('Sign up to Learner'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter a email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val.isEmpty ? 'Enter a password' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(email.trim(), password);
                      if(result == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                          loading = true;
                        });
                      }
                    }
                  },
                  color: Colors.lightBlue,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              RichText(
               text: TextSpan(
                 text:'Already have an account? ',
                 style: TextStyle(fontSize: 15, color: Colors.black),
                 children: <TextSpan> [
                   TextSpan(
                     text: 'Log in',
                     style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
                     recognizer: new TapGestureRecognizer()
                     ..onTap = () { widget.toggleView();}
                   )
                 ]
               )
              )
            ],
          ),
        ),
      ),
    );
  }
}
