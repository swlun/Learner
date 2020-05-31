import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learner/core/models/activities.dart';
import 'package:learner/core/models/teacherDoneList.dart';
import 'package:learner/core/models/teacherPendingList.dart';

class UserActivitiesCRUD extends ChangeNotifier {
  final String uid;
  UserActivitiesCRUD({this.uid});

  //collection reference
  final CollectionReference userActivitiesCollection =
      Firestore.instance.collection('UserActivities');

  //add new activities
  Future addActivity(
      String request,
      String address,
      String date,
      String description,
      String endTime,
      String title,
      String location,
      String price,
      String startTime,
      String subject,
      String tag) async {
    return await userActivitiesCollection
        .document(this.uid)
        .collection(request)
        .add({
      'address': address,
      'date': date,
      'description': description,
      'endTime': endTime,
      'title': title,
      'location': location,
      'price': price,
      'startTime': startTime,
      'subject': subject,
      'tag': tag,
    });
  }

  Future<List<Activities>> getActivitiesList( String request) {
    return userActivitiesCollection
        .document(this.uid)
        .collection(request)
        .getDocuments()
        .then((value) {
      return value.documents.map((doc) {
        return Activities(
          id: doc.documentID,
          address: doc.data['address'],
          date: doc.data['date'],
          description: doc.data['description'],
          endTime: doc.data['endTime'],
          location: doc.data['location'],
          price: doc.data['price'],
          startTime: doc.data['startTime'],
          subject: doc.data['subject'],
          tag: doc.data['tag'],
          title: doc.data['title'],
        );
      }).toList();
    });
  }

  TeacherPendingList getTeacherPendingActivitiesList() {
    return TeacherPendingList(teacherPendingList: getActivitiesList('teacherPending'));
  }

  TeacherDoneList getTeacherDoneActivitiesList() {
    return TeacherDoneList(teacherDoneList: getActivitiesList('teacherDone'));
  }

  //get activities list from snapshot
  // List<Activities> _activitiesListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return Activities(
  //       id: doc.documentID,
  //       address: doc.data['address'],
  //       date: doc.data['date'],
  //       description: doc.data['description'],
  //       endTime: doc.data['endTime'],
  //       location: doc.data['location'],
  //       price: doc.data['price'],
  //       startTime: doc.data['startTime'],
  //       subject: doc.data['subject'],
  //       tag: doc.data['tag'],
  //       title: doc.data['title'],
  //     );
  //   }).toList();
  // }
}
