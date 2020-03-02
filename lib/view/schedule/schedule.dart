import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
 final String test;

Schedule(this.test);

 @override
 Widget build(BuildContext context) {
   return Container(
     child: new Text(test, style: TextStyle(color: Colors.grey[800]))
   );
 }
}