import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  final String test;

  Schedule(this.test);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: <Widget>[
      Text(test, style: TextStyle(color: Colors.grey[800])),
      Spacer(),
      FlatButton.icon(
          onPressed: () {
            createAddActivityDialog(context).then((val) {
              if( val != null) {
                if(val) {
                  SnackBar hint = SnackBar(content: Text('New Event Added'),);
                  Scaffold.of(context).showSnackBar(hint);
                }
              }
            });
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Colors.green,
          icon: Icon(Icons.add),
          label: Text('ADD'))
    ]));
  }

  createAddActivityDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Event'),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Add'),
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }
}
