import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/shared/loading.dart';

import '../profile.dart';

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
        : Material(child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Learner'),
              elevation: 0.0,
              // actions: <Widget>[
              //   FlatButton.icon(
              //       onPressed: () async {
              //         navigateBack(context);
              //       },
              //       icon: Icon(Icons.exit_to_app),
              //       label: Text('Logout'))
              // ],
            ),
            body: Column(
              children: <Widget>[
                ListTile(
                    trailing: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.blue,
                    ),
                    title: Text('Hi, ' + widget.user.name,style: TextStyle(fontSize:20 ),),
                    subtitle: Text(
                        'Joined in ${getJoinMonth(widget.user.joinedIn)}, ${getJoinYear(widget.user.joinedIn)}',style: TextStyle(fontSize:20 ),)),
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

  void navigateBack(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Profile()));
  }
}
