import 'package:flutter/material.dart';
import 'package:learner/core/crud/userActivitiesCRUD.dart';
import 'package:learner/core/models/activities.dart';
import 'package:learner/core/models/user.dart';
import 'package:learner/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

class ScheduleList extends StatefulWidget {
  final String getList;

  ScheduleList({this.getList});

  @override
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return FutureBuilder(
        future: UserActivitiesCRUD(
                uid: user.uid, request: widget.getList)
            .getActivitiesList,
        builder: (context, AsyncSnapshot<List<Activities>> activitiesList) {
          return activitiesList.data == null
              ? Loading()
              : Container(
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
                                  onTap: () {
                                    
                                  },
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
                      }));
        });
  }
  }