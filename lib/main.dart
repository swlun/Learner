import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learner/core/crud/activitiesListCRUD.dart';
import 'package:learner/core/crud/userProfileCRUD.dart';
import 'package:learner/core/crud/userActivitiesCRUD.dart';
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
    return MultiProvider(
        providers: [
          StreamProvider<User>(
            create: (_) => AuthService().user,
            initialData: null,
          ),
          ListenableProxyProvider<User, UserProfileCRUD>(
              update: (_, user, __) => UserProfileCRUD(uid: user.uid)),
          ListenableProxyProvider<User, UserActivitiesCRUD>(
              update: (_, user, __) => UserActivitiesCRUD(uid: user.uid)),
          ListenableProxyProvider<User, ActivitiesListCRUD>(
              update: (_, user, __) => ActivitiesListCRUD(uid: user.uid)),
        ],
        child: MaterialApp(
          home: Wrapper(),
          title: 'Learner',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
