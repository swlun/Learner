import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learner/core/crud/activitiesListCRUD.dart';
import 'package:learner/core/crud/userActivitiesCRUD.dart';
import 'package:provider/provider.dart';

class AddSchedule extends StatefulWidget {
  final BuildContext context;
  AddSchedule({this.context});

  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  final _formKey = GlobalKey<FormState>();
  final dateFormat = DateFormat('dd/MM/yyyy');
  final timeFormat = DateFormat('HH:mm');

  //text field state
  String _address,
      _date,
      _description,
      _endTime,
      _title,
      _location,
      _price,
      _startTime,
      _subject,
      _tag;

  @override
  Widget build(BuildContext context) {
    final userActivitiesProvider = Provider.of<UserActivitiesCRUD>(context);
    final activitiesListProvider = Provider.of<ActivitiesListCRUD>(context);

    Future<bool> saveForm() async {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();

        print('location: ' + _location);

        userActivitiesProvider.addActivity('teacherPending', _address, _date, _description,
            _endTime, _title, _location, _price, _startTime, _subject, _tag);

        activitiesListProvider.addActivity(_address, _date, _description,
            _endTime, _title, _location, _price, _startTime, _subject, _tag);
      }

      return _formKey.currentState.validate();
    }

    return SingleChildScrollView(
      child: AlertDialog(
        title: Text('New Schedule'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 200,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                      subtitle: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          isDense: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Subject",
                        ),
                        value: _subject,
                        onChanged: (String val) {
                          setState(() => _subject = val);
                        },
                        items: <String>['English', 'Chinese', 'Math', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        hintText: 'Please insert a class title',
                      ),
                      onSaved: (input) => _title = input,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
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
                          floatingLabelBehavior: FloatingLabelBehavior.always,
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
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        hintText: 'e.g. 14, Jalan Gembira',
                      ),
                      onSaved: (input) => _address = input,
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                      subtitle: DateTimeField(
                        decoration: InputDecoration(
                          isDense: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Date",
                        ),
                        format: dateFormat,
                        onSaved: (input) => _date = input.toString(),
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
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Start Time",
                        ),
                        format: timeFormat,
                        onSaved: (input) => _startTime = input.toString(),
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
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "End Time",
                        ),
                        format: timeFormat,
                        onSaved: (input) => _endTime = input.toString(),
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
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Price',
                        hintText: 'e.g. 100',
                      ),
                      onSaved: (input) => _price = input,
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
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
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
              saveForm();
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    );
  }
}
