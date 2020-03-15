import 'package:flutter/material.dart';
import 'package:learner/models/user.dart';
import 'package:learner/models/userProfile.dart';
import 'package:learner/services/database.dart';
import 'package:learner/shared/loading.dart';
import 'package:learner/view/screen/profile/profileShowDetail.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //final userProfile = Provider.of<UserProfile>(context);

    return FutureProvider<UserProfile>.value(
      value: DatabaseService(uid: user.uid).userProfile,
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
                      //backgroundImage: AssetImage('assets/images/profile_background'),
                    ),
                    title: Text(myProfile.name),
                    subtitle: InkWell(
                      child: Text(
                        'View Profile',
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                      onTap: () {
                        navigateToProfileShowDetail(context, myProfile);
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

  void navigateToProfileShowDetail(context, UserProfile user) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileShowDetails(user: user)));
  }
}
