import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/shared/loading.dart';
import 'package:learner/view/screen/profile/profileShowDetail.dart';
import 'package:provider/provider.dart';

class ProfileDetailCard extends StatefulWidget {
  @override
  _ProfileDetailCardState createState() => _ProfileDetailCardState();
}

class _ProfileDetailCardState extends State<ProfileDetailCard> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProfile>(context);

    return user == null ? Loading() : Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue,
          ),
          title: Text(user.name),
          subtitle: Text('Description: ${user.description}'),
          onTap: () {
            ProfileShowDetails();
          },
          ),
        );
  }
}
