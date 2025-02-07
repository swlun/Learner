import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learner/core/models/activities.dart';

class ActivitiesListCRUD extends ChangeNotifier {

  final String uid;
  ActivitiesListCRUD({this.uid});
  
  //collection reference
  final CollectionReference activitiesListCollection = Firestore.instance.collection('ActivitiesList');

  //get activities stream
  Stream<List<Activities>> get activitiesList {
    //return activitiesListCollection.document(subject).collection(location).snapshots()
    return activitiesListCollection.snapshots().map(_activitiesListFromSnapshot);
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
  Future<String> addActivity(String address, String date, String description,String endTime, String title, String location, String price, String startTime, String subject, String tag) async {
    DocumentReference docRef = await activitiesListCollection.add({
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

    return docRef.documentID;
  }
}