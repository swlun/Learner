import 'package:flutter/material.dart';
import 'package:learner/core/models/activities.dart';

class TeacherPendingList with ChangeNotifier {
  final Future<List<Activities>> teacherPendingList;

  TeacherPendingList({ this.teacherPendingList});
}