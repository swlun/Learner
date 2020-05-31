import 'package:flutter/material.dart';
import 'package:learner/core/models/activities.dart';

class TeacherDoneList with ChangeNotifier {
  final Future<List<Activities>> teacherDoneList;

  TeacherDoneList({ this.teacherDoneList});
}