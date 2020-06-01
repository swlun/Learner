import 'package:flutter/material.dart';
import 'package:learner/core/models/activities.dart';
import 'package:learner/core/models/userProfile.dart';
import 'package:provider/provider.dart';

import 'addSchedule.dart';

class PendingSchedule extends StatefulWidget {
  @override
  _PendingScheduleState createState() => _PendingScheduleState();
}

class _PendingScheduleState extends State<PendingSchedule> {
  @override
  Widget build(BuildContext context) {
    final activitiesList = Provider.of<List<Activities>>(context);
    final userData = Provider.of<UserProfile>(context);

    List<Activities> pendingList = new List<Activities>();

    activitiesList.forEach((item) {
      if (userData.teacherPending.contains(item.id)) {
        pendingList.add(item);
      }
    });

    return Scaffold(
        body: Container(
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: activitiesList.length,
                itemBuilder: (BuildContext context, int index) {
                  Activities currentActivities = activitiesList[index];
                  return Card(
                    elevation: 3,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: ListTile(
                            onTap: () {},
                            title: Row(
                              children: <Widget>[
                                Text(
                                  currentActivities.title,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Date: ' + currentActivities.date)),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('time: ' +
                                        currentActivities.startTime +
                                        '  ~  ' +
                                        currentActivities.endTime)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            return showDialog(
                context: context,
                builder: (context) {
                  return AddSchedule(context: context);
                }).then((val) {
              if (val != null) {
                if (val) {
                  SnackBar hint = SnackBar(
                    content: Text('New Event Added'),
                  );
                  Scaffold.of(context).showSnackBar(hint);
                } else {
                  SnackBar hint = SnackBar(
                    content: Text('Event Not Added, Please Try Again.'),
                  );
                  Scaffold.of(context).showSnackBar(hint);
                }
              }
            });
          },
          tooltip: 'Add Favourite',
          child: new Icon(Icons.add),
        ));
  }
}
