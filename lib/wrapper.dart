import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/models/user.dart';
import 'default_screen.dart';
import 'ui/view/authenticationScreen/authenticate.dart';


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
