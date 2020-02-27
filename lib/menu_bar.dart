import 'package:flutter/material.dart';
import './placeholder.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

enum _tabs { home, favourite, schedule, chat, profile}
class _HomeState extends State<Home> {
  int _currentIndex = 0;
  
  final List<Widget> _children = [
    PlaceHolder(0),
    PlaceHolder(1),
    PlaceHolder(_tabs.schedule.index),
    PlaceHolder(_tabs.chat.index),
    PlaceHolder(_tabs.profile.index)
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learner'),
      ),
      body: Column(children: [Text(_currentIndex.toString()),_children[_currentIndex]]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: Colors.grey[800]),
            title:
                new Text('Home', style: TextStyle(color: Colors.grey[800])),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite, color: Colors.grey[800]),
            title: new Text('Favourite', style: TextStyle(color: Colors.grey[800])),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.calendar_today, color: Colors.grey[800]),
            title: new Text('Schedule', style: TextStyle(color: Colors.grey[800])),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.chat, color: Colors.grey[800]),
            title: new Text('Chat', style: TextStyle(color: Colors.grey[800])),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person, color: Colors.grey[800]),
            title: new Text('Profile', style: TextStyle(color: Colors.grey[800])),
          ),
        ]
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
