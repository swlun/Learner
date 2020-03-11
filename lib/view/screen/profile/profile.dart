import 'package:flutter/material.dart';
import 'package:learner/models/user.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/services/database.dart';
import 'package:learner/view/screen/profile/profileDetailCard.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  final String test;

  Profile(this.test);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return FutureProvider<UserProfile>.value(
      value: DatabaseService(uid: user.uid).userProfile,
      child: Scaffold(
        
         backgroundColor: Colors.blue[100],
         body: ProfileDetailCard(),
      ), 
    );
  }
}
