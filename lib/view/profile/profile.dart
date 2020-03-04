import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/services/database.dart';
import 'package:learner/view/profile/profileDetail.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  final String test;

  Profile(this.test);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserProfile>>.value(
      value: DatabaseService().users,
      child: Scaffold(
         backgroundColor: Colors.blue[100],
         body: ProfileDetail(),
      ), 
    );
  }
}
