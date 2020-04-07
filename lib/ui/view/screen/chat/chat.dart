import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
 final String test;

 Chat(this.test);

 @override
 Widget build(BuildContext context) {
   return Container(
     child: new Text(test, style: TextStyle(color: Colors.grey[800]))
   );
 }
}