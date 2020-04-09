import 'package:flutter/material.dart';
import 'package:learner/core/models/user.dart';
import 'package:provider/provider.dart';
import 'addSchedule.dart';

class Schedule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Container(
        child: Row(children: <Widget>[
      Spacer(),
      FlatButton.icon(
          onPressed: () {
            return showDialog(
                context: context,
                builder: (context) {
                  return AddSchedule(context: context, uid: user.uid);
                }).then((val) {
              if (val != null) {
                if (val) {
                  SnackBar hint = SnackBar(
                    content: Text('New Event Added'),
                  );
                  Scaffold.of(context).showSnackBar(hint);
                }
              }
            });
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Colors.green,
          icon: Icon(Icons.add),
          label: Text('ADD'))
    ]));
  }

}
