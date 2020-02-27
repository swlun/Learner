import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 final String test;

Home(this.test);

 @override
 Widget build(BuildContext context) {
   return Container(
     child: new Text(test, style: TextStyle(color: Colors.grey[800]))
   );
 }
}