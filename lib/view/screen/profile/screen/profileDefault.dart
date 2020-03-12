import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/shared/loading.dart';
import 'package:learner/view/screen/profile/screen/profileShowDetail.dart';
import 'package:provider/provider.dart';

class ProfileDefault extends StatefulWidget {
  @override
  _ProfileDefaultState createState() => _ProfileDefaultState();
}

class _ProfileDefaultState extends State<ProfileDefault> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProfile>(context);

    return user == null
        ? Loading()
        : Container(
            decoration: new BoxDecoration(
                border: new Border(
                    bottom:
                        new BorderSide(width: 5.0, color: Colors.grey[300])),
                color: Colors.white),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.blue,
              ),
              title: Text(user.name),
              subtitle: Text('Description: ${user.description}'),
              trailing: Icon(Icons.border_color),
              onTap: () {
                print('taped');
                return ProfileShowDetails();
              },
            ),
          );
  }
}
