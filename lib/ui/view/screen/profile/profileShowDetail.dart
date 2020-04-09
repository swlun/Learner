import 'package:flutter/material.dart';
import 'package:learner/core/crud/userProfileCRUD.dart';
import 'package:learner/core/models/userProfile.dart';
import 'package:learner/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

import 'profileEdit.dart';

class ProfileShowDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileCRUD>(context);

    return StreamBuilder(
      stream: userProfileProvider.userProfileStream,
      builder: (context, profile) {
        return profile.data == null
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
                            navigateToEditDetails(context, profile.data);
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
                                backgroundImage:
                                    NetworkImage(profile.data.userImage),
                              ),
                              title: Text(
                                'Hi, ' + profile.data.name,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                'Joined in ${getJoinMonth(profile.data.joinedIn)}, ${getJoinYear(profile.data.joinedIn)}',
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
                              title: Text('Lives in ${profile.data.location}'),
                            ),
                          )
                        ],
                      ),
                    )));
      },
    );
  }
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
          builder: (context) => ProfileEdit(userProfile: myProfile)));
}
