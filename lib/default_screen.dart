import 'package:flutter/material.dart';
import 'package:learner/ui/view/screen/chat/chat.dart';
import 'package:learner/ui/view/screen/favourite/favourite.dart';
import 'package:learner/ui/view/screen/profile/profile.dart';
import 'package:learner/ui/view/screen/schedule/schedule.dart';
import 'core/services/auth.dart';
import 'ui/view/screen/home/home.dart';
import 'ui/widgets/loading.dart';

class DefaultScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenState();
  }
}

class PageNavigate {
  const PageNavigate(
    this.title,
    this.icon,
  );
  final String title;
  final IconData icon;
}

const List<PageNavigate> allDestinations = <PageNavigate>[
  PageNavigate('Home', Icons.home),
  PageNavigate('Favourite', Icons.favorite),
  PageNavigate('Schedule', Icons.calendar_today),
  PageNavigate('Chat', Icons.chat),
  PageNavigate('Profile', Icons.person),
];

class _ScreenState extends State<DefaultScreen> {
  final AuthService _auth = AuthService();
  bool loading = false;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Favourite('favourite'),
    Schedule('schedule'),
    Chat('chat'),
    Profile(),
  ];

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            //backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                'Learner',
                style: TextStyle(color: Colors.blueGrey),
              ),
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
            body: SafeArea(
              top: false,
              child: Container(
                child: _pages[_currentIndex],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              items: allDestinations.map((PageNavigate item) {
                return BottomNavigationBarItem(
                    icon: Icon(item.icon),
                    backgroundColor: Colors.grey[800],
                    title: Text(item.title));
              }).toList(),
            ),
          );
  }
}
