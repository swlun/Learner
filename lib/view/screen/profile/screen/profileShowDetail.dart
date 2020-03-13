import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/shared/loading.dart';

class ProfileShowDetails extends StatefulWidget {
  final UserProfile user;

  ProfileShowDetails({this.user});

  @override
  _ProfileShowDetailsState createState() => _ProfileShowDetailsState();
}

class _ProfileShowDetailsState extends State<ProfileShowDetails> {
  @override
  Widget build(BuildContext context) {
    print('this widget:' + widget.user.joinedIn);
    return widget.user == null
        ? Loading()
        : Material(child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                    trailing: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.blue,
                    ),
                    title: Text('Hi, ' + widget.user.name),
                    subtitle: Text(
                        'Joined in ${getJoinMonth(widget.user.joinedIn)}, ${getJoinYear(widget.user.joinedIn)}')),
                Divider(
                  color: Colors.grey,
                )
              ],
            ),
          ));
  }

  String getJoinMonth(String userJoinIn) {
    return userJoinIn.substring(0, userJoinIn.length - 4);
  }

  String getJoinYear(String userJoinIn) {
    return userJoinIn.substring(userJoinIn.length - 4, userJoinIn.length);
  }
}
