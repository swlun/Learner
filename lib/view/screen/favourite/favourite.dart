import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
 final String test;

 Favourite(this.test);

 @override
 Widget build(BuildContext context) {
   return Container(
     child: new Text(test, style: TextStyle(color: Colors.grey[800]))
   );
 }
}