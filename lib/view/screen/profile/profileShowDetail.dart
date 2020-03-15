import 'package:flutter/material.dart';
import 'package:learner/models/userProfile.dart';
import 'package:learner/shared/loading.dart';
import 'package:learner/view/screen/profile/profileEdit.dart';

class ProfileShowDetails extends StatelessWidget {
  final UserProfile user;
  ProfileShowDetails({this.user});

  @override
  Widget build(BuildContext context) {
    return this.user == null
        ? Loading()
        : Material(
            child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.grey),
              backgroundColor: Colors.white,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                    onPressed: () async {
                      navigateToEditDetails(context, this.user);
                    },
                    icon: Icon(Icons.edit),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  ListTile(
                      trailing: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Colors.blue,
                      ),
                      title: Text(
                        'Hi, ' + this.user.name,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        'Joined in ${getJoinMonth(this.user.joinedIn)}, ${getJoinYear(this.user.joinedIn)}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: Text('About'),
                    subtitle: ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Lives in ${this.user.location}'),
                    ),
                  )
                ],
              ),
            ),
          ));
  }
}

String getJoinMonth(String userJoinIn) {
  return userJoinIn.substring(0, userJoinIn.length - 4);
}

String getJoinYear(String userJoinIn) {
  return userJoinIn.substring(userJoinIn.length - 4, userJoinIn.length);
}

void navigateToEditDetails(context, UserProfile user) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProfileEdit(user: user)));
}
