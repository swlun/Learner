import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
          child: TabBar(
            tabs: <Widget>[
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
            ],
          ),
        ),
        Flexible(
          child: Container(
            child: TabBarView(children: [
              Container(
                child: Text("Pending"),
              ),
              Container(
                child: Text("Done"),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
