import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learner/shared/constants.dart';
import 'package:learner/view/screen/schedule/addSchedule.dart';

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
            return showDialog(
                context: context,
                builder: (context) {
                  return AddSchedule(context: context);
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

  createAddActivityDialog(BuildContext context) {
    //TextEditingController customController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('HH:mm');

    //text field state
    String _date, _description, _location, _time, _userId, _tag, _price;

    return showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('New Event'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Form(
                key: _formKey,
                child: Container(
                  width: 300,
                  height: 450,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          hintText: 'Something about your class......',
                        ),
                        onSaved: (input) => _description = input,
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                        subtitle: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            isDense: true,
                            hasFloatingPlaceholder: true,
                            labelText: "Location",
                          ),
                          value: _location,
                          onChanged: (String val) {
                            _location = val;
                          },
                          items: <String>[
                            'Kuala Lumpur',
                            'Petaling Jaya',
                            'Johor',
                            'Pulau Pinang'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          hintText: 'e.g. 14, Jalan Gembira',
                        ),
                        onSaved: (input) => _location = input,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Price',
                          hintText: 'e.g. 100',
                        ),
                        onSaved: (input) => _price = input,
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                        subtitle: DateTimeField(
                          decoration: InputDecoration(
                            isDense: true,
                            hasFloatingPlaceholder: true,
                            labelText: "Date",
                          ),
                          format: dateFormat,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                              context: context,
                              initialDate: currentValue ?? DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                        subtitle: DateTimeField(
                          decoration: InputDecoration(
                            isDense: true,
                            hasFloatingPlaceholder: true,
                            labelText: "Time",
                          ),
                          format: timeFormat,
                          onShowPicker: (context, currentValue) async {
                            final TimeOfDay time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.convert(time);
                          },
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Tag',
                        ),
                        onSaved: (input) => _tag = input,
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  child: Text('Cancel'),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MaterialButton(
                  elevation: 5.0,
                  child: Text('Add'),
                  color: Colors.green,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            ),
          );
        });
  }
}
