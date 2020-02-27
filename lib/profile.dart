import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
 final String test;

 Profile(this.test);

 @override
 Widget build(BuildContext context) {
   return Container(
     child: new Text(test, style: TextStyle(color: Colors.grey[800]))
   );
 }
}