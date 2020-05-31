import 'package:flutter/material.dart';
import 'package:learner/core/models/activities.dart';
import 'package:learner/core/models/teacherDoneList.dart';
import 'package:learner/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

class DoneSchedule extends StatefulWidget {
  @override
  _DoneScheduleState createState() => _DoneScheduleState();
}

class _DoneScheduleState extends State<DoneSchedule> {
  @override
  Widget build(BuildContext context) {
    final doneActivitiesList = Provider.of<TeacherDoneList>(context);

    return FutureBuilder(
        future: doneActivitiesList.teacherDoneList,
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
                          })));
        });
  }
}
