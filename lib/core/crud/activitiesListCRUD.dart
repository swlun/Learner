import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learner/core/models/activities.dart';

class ActivitiesListCRUD extends ChangeNotifier {

  final String uid;
  final String subject;
  final String location;
  ActivitiesListCRUD({this.uid, this.subject, this.location});
  
  //collection reference
  final CollectionReference activitiesListCollection = Firestore.instance.collection('ActivitiesList');

  //get activities stream
  Stream<List<Activities>> get activitiesList {
    return activitiesListCollection.document(subject).collection(location).snapshots()
    .map(_activitiesListFromSnapshot);
  }

  //get activities list from snapshot
  List<Activities> _activitiesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
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
  }

  //add new activities 
  Future addActivity(String address, String date, String description,String endTime, String title, String location, String price, String startTime, String subject, String tag) async {
    return await activitiesListCollection.document(subject).collection(location).add({
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
}