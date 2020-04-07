import 'package:flutter/material.dart';
import 'package:learner/core/models/user.dart';
import 'package:learner/core/models/userProfile.dart';
import 'package:learner/core/services/database.dart';
import 'package:learner/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

import 'profileEdit.dart';

class ProfileShowDetails extends StatelessWidget {
  
  // final UserProfile user;
  // ProfileShowDetails({this.user});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    return FutureProvider<UserProfile>.value(
      value: DatabaseService(uid: user.uid).userProfile,
      child: Container(
          child: Consumer<UserProfile>(builder: (context, myProfile, child) {
          return myProfile == null
            ? Loading()
            : Material(
            child: Scaffold(
            //backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.grey),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                    onPressed: () async {
                      navigateToEditDetails(context, myProfile);
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
                        backgroundImage: NetworkImage(myProfile.userImage),
                      ),
                      title: Text(
                        'Hi, ' + myProfile.name,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        'Joined in ${getJoinMonth(myProfile.joinedIn)}, ${getJoinYear(myProfile.joinedIn)}',
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
                      title: Text('Lives in ${myProfile.location}'),
                    ),
                  )
                ],
              ),
            ),
          ));
        })
      )
    );
  }

  String getJoinMonth(String userJoinIn) {
    return userJoinIn.substring(0, userJoinIn.length - 4);
  }

  String getJoinYear(String userJoinIn) {
    return userJoinIn.substring(userJoinIn.length - 4, userJoinIn.length);
  }

  void navigateToEditDetails(context, UserProfile myProfile) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileEdit(userProfile: myProfile))
    );
  }
}