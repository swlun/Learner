import 'package:flutter/material.dart';
import 'package:learner/core/crud/activitiesListCRUD.dart';
import 'package:learner/core/crud/userActivitiesCRUD.dart';
import 'package:learner/core/crud/userProfileCRUD.dart';
import 'package:learner/core/models/activities.dart';
import 'package:learner/core/models/teacherDoneList.dart';
import 'package:learner/core/models/teacherPendingList.dart';
import 'package:learner/core/models/userProfile.dart';
import 'package:provider/provider.dart';

import 'core/models/user.dart';
import 'default_screen.dart';
import 'ui/view/authenticationScreen/authenticate.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    if(user == null) {
      return Authenticate();
    }
    else {
      return MultiProvider(providers: [
          ChangeNotifierProvider<TeacherPendingList>(
            create: (_) => UserActivitiesCRUD(uid: user.uid)
                .getTeacherPendingActivitiesList(),
          ),
          ChangeNotifierProvider<TeacherDoneList>(
            create: (_) => UserActivitiesCRUD(uid: user.uid)
                .getTeacherDoneActivitiesList(),
          ),
          StreamProvider<List<Activities>>(
            create: (_) =>
                ActivitiesListCRUD(uid: user.uid).activitiesList,
          ),
          //ListenableProxyProvider<User, TeacherDoneList>( update: (_, user, __) => UserActivitiesCRUD(uid: user.uid).getTeacherDoneActivitiesList(),),
          StreamProvider<UserProfile>(
              create: (_) =>
                  UserProfileCRUD(uid: user.uid).userProfileStream),
          ListenableProxyProvider<User, UserProfileCRUD>(
              update: (_, user, __) => UserProfileCRUD(uid: user.uid)),
          ListenableProxyProvider<User, UserActivitiesCRUD>(
              update: (_, user, __) => UserActivitiesCRUD(uid: user.uid)),
          ListenableProxyProvider<User, ActivitiesListCRUD>(
              update: (_, user, __) => ActivitiesListCRUD(uid: user.uid)),],
      child: DefaultScreen());
    }
  }
}
