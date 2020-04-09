import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddSchedule extends StatefulWidget {
  final BuildContext context;
  final String uid;
  AddSchedule({this.context, this.uid});

  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  final _formKey = GlobalKey<FormState>();
  final dateFormat = DateFormat('dd/MM/yyyy');
  final timeFormat = DateFormat('HH:mm');

  //text field state
  String _date, _description, _location, _time, _userId, _tag, _price;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: Text('New Event'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Form(
          key: _formKey,
          child: Container(
            width: 300,
            height: 510,
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
                      setState(() => _location = val);
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
                      labelText: "Start Time",
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
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  subtitle: DateTimeField(
                    decoration: InputDecoration(
                      isDense: true,
                      hasFloatingPlaceholder: true,
                      labelText: "End Time",
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
                // flutter_tags
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
  }

  Future<bool> saveForm() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      addActivity(context);
    }

    return _formKey.currentState.validate();
  }

  Future addActivity(BuildContext context) async {
    // UserActivities(uid: widget.uid)
    //     .editUserProfile(_name, _birthday, _location, _occupation, _imageUrl);
  }
}
