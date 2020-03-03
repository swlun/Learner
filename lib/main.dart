import 'package:flutter/material.dart';
import 'package:learner/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:learner/models/user.dart';

import './wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Learner',
        home: Wrapper(),
      ),
    );
  }
}
