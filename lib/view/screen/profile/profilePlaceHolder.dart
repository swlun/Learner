import 'package:flutter/material.dart';

import 'package:learner/view/screen/profile/screen/profileDefault.dart';
import 'package:learner/view/screen/profile/screen/profileShowDetail.dart';


class ProfilePlaceHolder extends StatelessWidget {
 final int tab;

 ProfilePlaceHolder(this.tab);

 @override
 Widget build(BuildContext context) {
    switch(tab) {
      case 0: return ProfileDefault();
      case 1: return ProfileShowDetails();
      default: return ProfileDefault();
    }
 }
}