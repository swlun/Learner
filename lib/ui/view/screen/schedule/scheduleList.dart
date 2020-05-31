import 'package:flutter/material.dart';
import 'package:learner/core/crud/userActivitiesCRUD.dart';
import 'package:learner/core/models/activities.dart';
import 'package:learner/core/models/teacherDoneList.dart';
import 'package:learner/core/models/teacherPendingList.dart';
import 'package:learner/core/models/user.dart';
import 'package:learner/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

import 'addSchedule.dart';

class ScheduleList extends StatefulWidget {
  final int getList;
  final bool showFloatingBtn;

  ScheduleList({this.getList, this.showFloatingBtn = false});

  @override
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final pendingActivitiesList = Provider.of<TeacherPendingList>(context);
    final doneActivitiesList = Provider.of<TeacherDoneList>(context);

    return FutureBuilder(
        future: widget.getList == 0 ? pendingActivitiesList.teacherPendingList : doneActivitiesList.teacherDoneList,
        builder: (context, AsyncSnapshot<List<Activities>> activitiesList) {
          return activitiesList.data == null
              ? Loading()
              : Scaffold(
                  body: Container(
                      padding: EdgeInsets.zero,
                      width: double.maxFinite,
                      child: ListView.builder(
                          itemCount: activitiesList.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Activities currentActivities =
                                activitiesList.data[index];
                            return Card(
                              elevation: 3,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, bottom: 5.0),
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
                                              child: Text('Date: ' +
                                                  currentActivities.date)),
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
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.endFloat,
                  floatingActionButton: widget.showFloatingBtn == true
                      ? FloatingActionButton(
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
                                    content: Text(
                                        'Event Not Added, Please Try Again.'),
                                  );
                                  Scaffold.of(context).showSnackBar(hint);
                                }
                              }
                            });
                          },
                          tooltip: 'Add Favourite',
                          child: new Icon(Icons.add),
                        )
                      : new Container(width: 0, height: 0));
        });
  }
}
