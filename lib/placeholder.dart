import 'package:flutter/material.dart';

import 'ui/view/screen/chat/chat.dart';
import 'ui/view/screen/favourite/favourite.dart';
import 'ui/view/screen/home/home.dart';
import 'ui/view/screen/profile/profile.dart';
import 'ui/view/screen/schedule/schedule.dart';


class PlaceHolder extends StatelessWidget {
 final int tab;

 PlaceHolder(this.tab);

 @override
 Widget build(BuildContext context) {
    switch(tab) {
      case 0: return Home();
      case 1: return Favourite('favourite');
      case 2: return Schedule('schedule');
      case 3: return Chat('chat');
      case 4: return Profile();
      default: return Home();
    }
  }
}