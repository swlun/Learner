import 'package:flutter/material.dart';
import 'package:learner/ui/view/screen/schedule/scheduleList.dart';

typedef void StringCallback(String val);

class Schedule extends StatelessWidget{

  final List<Tab> tabList = <Tab>[
    Tab(
      text: 'Pending',
      // icon: Icon(
      //   Icons.access_time,
      //   color: Colors.blueGrey,
      // ),
    ),
    Tab(
      text: 'Done',
      // icon: Icon(
      //   Icons.done_all,
      //   color: Colors.blueGrey,
      // ),
    )
  ];

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
          child: TabBar(
            labelColor: Colors.blueGrey,
            tabs: tabList,
          ),
        ),
        Flexible(
            child: TabBarView(children: tabList.map((Tab tab) {
              if (tab.text == 'Pending'){
                return ScheduleList( getList: "teacherPending");
              }
              else {
                return ScheduleList( getList: "teacherDone");
              }  
            }).toList(),
            ),
        )
      ]),
    );
  }
}
