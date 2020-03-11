import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  // final UserProfile users;

  // UserTile({this.users});
  
  Widget build(BuildContext context) {
    final user = Provider.of<UserProfile>(context);
    
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue,
          ),
          title: Text(user.name),
          subtitle: Text('Description: ${user.description}'),
        )
      )
    );
  }
}