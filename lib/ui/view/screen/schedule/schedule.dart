import 'package:flutter/material.dart';
import 'package:learner/ui/view/screen/schedule/doneSchedule.dart';
import 'package:learner/ui/view/screen/schedule/pendingSchedule.dart';

class Schedule extends StatelessWidget {
  final List<Tab> tabList = [
     Tab(
       icon: Icon(
         Icons.access_time,
         color: Colors.blueGrey,
       ),
     ),
     Tab(
       icon: Icon(
         Icons.done_all,
         color: Colors.blueGrey,
       ),
     )
   ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
          child: TabBar(
            //controller: _tabController,
            labelColor: Colors.blueGrey,
            tabs: tabList,
          ),
        ),
        Flexible(
          child: TabBarView(
            //controller: _tabController,
            children: <Widget>[new PendingSchedule(), new DoneSchedule()],
          ),
        )
      ]),
    );
  }
}
