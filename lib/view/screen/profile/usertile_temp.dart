import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';

class UserTile extends StatelessWidget {
  final UserProfile users;

  UserTile({this.users});

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue,
          ),
          title: Text(users.name),
          subtitle: Text('Description: ${users.description}'),
        )
      )
    );
  }
}