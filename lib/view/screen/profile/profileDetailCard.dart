import 'package:flutter/material.dart';
import 'package:learner/view/screen/profile/usertile_temp.dart';

class ProfileDetailCard extends StatefulWidget {
  @override
  _ProfileDetailCardState createState() => _ProfileDetailCardState();
  
}

class _ProfileDetailCardState extends State<ProfileDetailCard> {
  @override
  Widget build(BuildContext context) {

    // final user = Provider.of<UserProfile>(context);
    // final userid = Provider.of<User>(context);

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return UserTile(); 
      },
    );
  }
}