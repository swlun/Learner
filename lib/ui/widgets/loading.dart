import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SpinKitChasingDots(
        color: Colors.blueGrey,
        size: 100.0,
      ),
    );
  }
}
