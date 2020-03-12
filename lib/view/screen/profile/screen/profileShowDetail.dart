import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/shared/loading.dart';
import 'package:provider/provider.dart';

class ProfileShowDetails extends StatefulWidget {
  @override
  _ProfileShowDetailsState createState() => _ProfileShowDetailsState();
}

class _ProfileShowDetailsState extends State<ProfileShowDetails> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProfile>(context);

    return user == null ? Loading() : Container(
       color: Colors.white,
       child: Column(
         children: <Widget>[
           ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.blue,
              ),
              title: Text('Hi, ' + user.name),
              subtitle: Text('Joined in ${getJoinMonth(user.joinedIn)}, ${getJoinYear(user.joinedIn)}')
           ),
           Divider(color: Colors.grey,)
         ],
       ),
    );
  }

  String getJoinMonth(String userJoinIn) {
    return userJoinIn.substring(0, userJoinIn.length-4);
  }

  String getJoinYear(String userJoinIn) {
    return userJoinIn.substring(userJoinIn.length-4, userJoinIn.length);
  }
}