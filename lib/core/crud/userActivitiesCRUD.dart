import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learner/core/models/activities.dart';

class UserActivitiesCRUD extends ChangeNotifier {
  final String uid;
  final String request;
  UserActivitiesCRUD({this.uid, this.request});

  //collection reference
  final CollectionReference userActivitiesCollection =
      Firestore.instance.collection('UserActivities');

  //add new activities
  Future addActivity(
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
        .collection(this.request)
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

  Future<List<Activities>> get getActivitiesList {
    return userActivitiesCollection
        .document(this.uid)
        .collection(this.request)
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
