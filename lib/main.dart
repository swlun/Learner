import 'package:flutter/material.dart';

import './menu_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Learner',
     home: Home(),
   );
 }
}
