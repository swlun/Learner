import 'package:flutter/material.dart';
import 'package:learner/models/user_profile.dart';
import 'package:learner/shared/loading.dart';

class ProfileEdit extends StatelessWidget {
  final UserProfile user;
  ProfileEdit({this.user});

  @override
  Widget build(BuildContext context) {
    return this.user == null
        ? Loading()
        : Material(
            child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.grey),
              backgroundColor: Colors.white,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  onPressed: () async {
                    //navigateBack(context);
                  },
                  icon: Icon(Icons.edit),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.grey,
                          child: ClipOval(
                            child: SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: Image.network("src", fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Username',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18.0),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'asd',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            Icons.edit,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
  }
}

String getJoinMonth(String userJoinIn) {
  return userJoinIn.substring(0, userJoinIn.length - 4);
}

String getJoinYear(String userJoinIn) {
  return userJoinIn.substring(userJoinIn.length - 4, userJoinIn.length);
}
