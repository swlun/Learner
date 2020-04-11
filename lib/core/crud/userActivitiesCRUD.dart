import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserActivitiesCRUD extends ChangeNotifier{

  final String uid;
  UserActivitiesCRUD({this.uid});
  
  //collection reference
  final CollectionReference userActivitiesCollection = Firestore.instance.collection('UserActivities');
  //final CollectionReference activitiesListCollection = Firestore.instance.collection('ActivitiesList');

  //add new activities 
  Future addActivity(String address, String date, String description,String endTime, String title, String location, String price, String startTime, String subject, String tag) async {
    return await userActivitiesCollection.document(this.uid).collection('teacherPending').add({
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