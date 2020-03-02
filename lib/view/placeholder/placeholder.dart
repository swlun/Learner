import 'package:flutter/material.dart';

import '../home/home.dart';
import '../favourite/favourite.dart';
import '../schedule/schedule.dart';
import '../chat/chat.dart';
import '../profile/profile.dart';

class PlaceHolder extends StatelessWidget {
 final int tab;

 PlaceHolder(this.tab);

 @override
 Widget build(BuildContext context) {
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