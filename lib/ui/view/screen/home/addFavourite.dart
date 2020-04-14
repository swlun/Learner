import 'package:flutter/material.dart';
import 'package:learner/core/models/activities.dart';

class AddFavourite extends StatelessWidget {
  final Activities currentActivity;

  AddFavourite({this.currentActivity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: Row(
          children: <Widget>[
            Text(currentActivity.title),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
          width: 300,
          height: 400,
          child: Column(
            children: <Widget>[
              Divider(),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Location: ' +
                        currentActivity.location +
                        '\n' +
                        'Address: ' +
                        currentActivity.address +
                        '\n',
                  )),
              Divider(),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Description: \n',
                  )),
              SingleChildScrollView(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      currentActivity.description,
                    )),
              ),
              Spacer(),
              Divider(),
            ],
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('ok'),
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
