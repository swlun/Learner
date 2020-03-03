import 'package:flutter/material.dart';
import 'package:learner/services/auth.dart';
import './placeholder.dart';

class DefaultScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenState();
  }
}

enum _tabs { home, favourite, schedule, chat, profile }

class _ScreenState extends State<DefaultScreen> {
  final AuthService _auth = AuthService();
  int _currentIndex = 0;

  final List<Widget> _children = [
    PlaceHolder(_tabs.home.index),
    PlaceHolder(_tabs.favourite.index),
    PlaceHolder(_tabs.schedule.index),
    PlaceHolder(_tabs.chat.index),
    PlaceHolder(_tabs.profile.index)
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learner'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.exit_to_app),
              label: Text('Logout'))
        ],
      ),
      body: _children[_currentIndex],
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
              title: new Text('Favourite',
                  style: TextStyle(color: Colors.grey[800])),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.calendar_today, color: Colors.grey[800]),
              title: new Text('Schedule',
                  style: TextStyle(color: Colors.grey[800])),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.chat, color: Colors.grey[800]),
              title:
                  new Text('Chat', style: TextStyle(color: Colors.grey[800])),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person, color: Colors.grey[800]),
              title: new Text('Profile',
                  style: TextStyle(color: Colors.grey[800])),
            ),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
