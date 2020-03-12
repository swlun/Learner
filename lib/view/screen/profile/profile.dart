import 'package:flutter/material.dart';
import 'package:learner/models/user.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/services/database.dart';
import 'package:learner/view/screen/profile/profilePlaceHolder.dart';
import 'package:provider/provider.dart';

enum _tabs { profile, showDetails }
// class Profile extends StatelessWidget {
//   final String test;

//   Profile(this.test);

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<User>(context);
//     int _currentIndex = 0;

//     final List<Widget> _children = [
//       ProfilePlaceHolder(_tabs.profile.index),
//       ProfilePlaceHolder(_tabs.showDetails.index),
//     ];

//     return FutureProvider<UserProfile>.value(
//       value: DatabaseService(uid: user.uid).userProfile,
//       child: Container(
//               child: _children[_currentIndex],
//             ),
//     );
//   }
// }

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  int _currentIndex = 0;

    final List<Widget> _children = [
      ProfilePlaceHolder(_tabs.profile.index),
      ProfilePlaceHolder(_tabs.showDetails.index),
    ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return FutureProvider<UserProfile>.value(
      value: DatabaseService(uid: user.uid).userProfile,
      child: _children[_currentIndex]
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
