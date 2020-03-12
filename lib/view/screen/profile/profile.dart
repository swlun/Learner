import 'package:flutter/material.dart';
import 'package:learner/models/user.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/services/database.dart';
import 'package:learner/view/screen/profile/screen/profileShowDetail.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return FutureProvider<UserProfile>.value(
      value: DatabaseService(uid: user.uid).userProfile,
      child: Container(
        child: RaisedButton(onPressed: () {
          navigateToProfileShowDetail(context);
        }),
      ),
    );
  }

  Future navigateToProfileShowDetail(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileShowDetails()));
  }
}
