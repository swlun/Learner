import 'package:flutter/material.dart';
import 'package:learner/ui/view/screen/schedule/scheduleList.dart';

import 'addSchedule.dart';

typedef void StringCallback(String val);

class Schedule extends StatefulWidget {
  const Schedule({ Key key}) : super(key: key);
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> with SingleTickerProviderStateMixin{
  final List<Tab> tabList = <Tab>[
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

  TabController _tabController;
  int _currentIndex = 0;
  VoidCallback onChanged;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, vsync: this, length: tabList.length);
    onChanged = () {
      setState(() {
        _currentIndex = this._tabController.index;
        print(_tabController.index);
      });
    };
    _tabController.addListener(onChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(
    //       body: 
          Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.blueGrey,
                tabs: tabList,
              ),
            ),
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: tabList.map((Tab tab) {
                  if ( _currentIndex == 0) {
                    return ScheduleList(getList: _currentIndex, showFloatingBtn: true);
                  } else {
                    return ScheduleList(getList: _currentIndex);
                  }
                }).toList(),
              ),
            )
          ]);
  }
}
