import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learner/core/crud/userProfileCRUD.dart';
import 'package:learner/core/models/userProfile.dart';
import 'package:learner/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

import 'profileShowDetail.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final userProfileFuture = Provider.of<Stream<UserProfile>>(context);
    final userProfileProvider = Provider.of<UserProfileCRUD>(context);

    return StreamBuilder(
      stream: userProfileProvider.userProfileStream,
      builder: (context, AsyncSnapshot<UserProfile> profile) {
        return profile.data == null
            ? Loading()
            : Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.blue,
                      backgroundImage: NetworkImage(profile.data.userImage),
                    ),
                    title: Text('test'),
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
      },
    );
  }
}

void navigateToProfileShowDetail(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProfileShowDetails()));
}
