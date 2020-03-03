import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learner/models/user.dart';

import 'package:learner/view/placeholder/default_screen.dart';
import './view/authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user == null) {
      return Authenticate();
    }
    else {
      return DefaultScreen();
    }
    
  }
}
