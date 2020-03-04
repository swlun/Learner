import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/view/profile/usertile_temp.dart';
import 'package:provider/provider.dart';

class ProfileDetail extends StatefulWidget {
  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<UserProfile>>(context);

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserTile(users: users[index]); 
      },
    );
  }
}