import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learner/core/crud/activitiesListCRUD.dart';
import 'package:learner/core/crud/userProfileCRUD.dart';
import 'package:learner/core/models/activities.dart';
import 'package:learner/core/models/userProfile.dart';
import 'package:learner/wrapper.dart';
import 'package:provider/provider.dart';

import 'core/models/user.dart';
import 'core/services/auth.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
        create: (_) => AuthService().user,
        child: Consumer<User>(
          builder: (_, user, child) => MultiProvider(
            providers: [
              StreamProvider<List<Activities>>(
                create: (_) => ActivitiesListCRUD(uid: user.uid).activitiesList,
              ),
              StreamProvider<UserProfile>(
                  create: (_) =>
                      UserProfileCRUD(uid: user.uid).userProfileStream),
            ],
            child: MaterialApp(
              home: Wrapper(),
              title: 'Learner',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            ),
          ),
        ));
  }
}
