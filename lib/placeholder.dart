import 'package:flutter/material.dart';

import './home.dart';
import './favourite.dart';
import './schedule.dart';
import './chat.dart';
import './profile.dart';

class PlaceHolder extends StatelessWidget {
 final int tab;

 PlaceHolder(this.tab);

 @override
 Widget build(BuildContext context) {
    print(tab);
    switch(tab) {
      case 0: return Home('Home');
      case 1: return Favourite('favourite');
      case 2: return Schedule('schedule');
      case 3: return Chat('chat');
      case 4: return Profile('profile');
      default: return Home('Default');
    }
 }
}