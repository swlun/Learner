import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/services/database.dart';
import 'package:learner/view/screen/profile/screen/profileData.dart';
import 'package:provider/provider.dart';

class ProfileShowDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('In profileShowDetail');
    var user;
    
    return FutureProvider<UserProfile>.value(
      value: DatabaseService(uid: user.uid).userProfile,
      child: ProfileData(),
    );
  }
}