import 'package:flutter/material.dart';
import 'package:learner/services/auth.dart';
import 'package:learner/shared/loading.dart';
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
  bool loading = false;
  int _currentIndex = 0;

  final List<Widget> _children = [
    PlaceHolder(_tabs.home.index),
    PlaceHolder(_tabs.favourite.index),
    PlaceHolder(_tabs.schedule.index),
    PlaceHolder(_tabs.chat.index),
    PlaceHolder(_tabs.profile.index)
  ];

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            //backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text('Learner', style: TextStyle(color: Colors.blueGrey),),
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      setState(() => loading = true);
                      await _auth.signOut();
                      setState(() => loading = false);
                    },
                    icon: Icon(Icons.exit_to_app),
                    label: Text('Logout'))
              ],
            ),
            body: Container(
              child: _children[_currentIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.home, color: Colors.grey[800]),
                    title: new Text('Home',
                        style: TextStyle(color: Colors.grey[800])),
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.favorite, color: Colors.grey[800]),
                    title: new Text('Favourite',
                        style: TextStyle(color: Colors.grey[800])),
                  ),
                  BottomNavigationBarItem(
                    icon:
                        new Icon(Icons.calendar_today, color: Colors.grey[800]),
                    title: new Text('Schedule',
                        style: TextStyle(color: Colors.grey[800])),
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.chat, color: Colors.grey[800]),
                    title: new Text('Chat',
                        style: TextStyle(color: Colors.grey[800])),
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
