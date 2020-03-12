import 'package:flutter/material.dart';

import 'package:learner/view/screen/home/home.dart';
import 'package:learner/view/screen/favourite/favourite.dart';
import 'package:learner/view/screen/schedule/schedule.dart';
import 'package:learner/view/screen/chat/chat.dart';
import 'package:learner/view/screen/profile/profile.dart';

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
      case 4: return Profile();
      default: return Home('Default');
    }
  }
}