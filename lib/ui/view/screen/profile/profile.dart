import 'package:flutter/material.dart';
import 'package:learner/core/crud/userProfileCRUD.dart';
import 'package:learner/core/models/user.dart';
import 'package:learner/core/models/userProfile.dart';
import 'package:learner/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

import 'profileShowDetail.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return FutureProvider<UserProfile>.value(
      value: UserProfileCRUD(uid: user.uid).userProfile,
      child: Container(
          child: Consumer<UserProfile>(builder: (context, myProfile, child) {
          return myProfile == null
            ? Loading()
            : Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.blue,
                      backgroundImage: NetworkImage(myProfile.userImage),
                    ),
                    title: Text(myProfile.name),
                    subtitle: InkWell(
                      child: Text(
                        'View Profile',
                        style: TextStyle(color: Colors.green[600]),
                      ),
                      onTap: () {
                        navigateToProfileShowDetail(context);
                      },
                    ),
                    trailing: Icon(Icons.person_outline),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text('Personal information'),
                    trailing: Icon(Icons.person_outline),
                  ),
                  Divider(
                    color: Colors.grey,
                    indent: 20,
                    endIndent: 20,
                  ),
                  ListTile(
                    title: Text('Personal information'),
                    trailing: Icon(Icons.person_outline),
                  )
                ],
              );
      })),
    );
  }

  void navigateToProfileShowDetail(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileShowDetails()));
  }
}
