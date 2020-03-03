import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learner/models/user.dart';

import './view/authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    return Authenticate();
  }
}
