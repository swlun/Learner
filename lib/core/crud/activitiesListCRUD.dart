import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learner/core/models/activities.dart';

class ActivitiesList {

  final String uid;
  ActivitiesList({this.uid});
  
  //collection reference
  final CollectionReference activitiesListCollection = Firestore.instance.collection('ActivitiesList');

  //get activities stream
  Stream<List<Activities>> get activitiesList {
    return activitiesListCollection.document('English').collection('kl').snapshots()
    .map(_activitiesListFromSnapshot);
  }

  //get activities list from snapshot
  List<Activities> _activitiesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Activities(
        date: doc.data['date'],
        description: doc.data['description'],
        location: doc.data['location'],
        time: doc.data['time'],
        tag: doc.data['tag'].cast<String>(),
        userId: doc.data['userId'],
        price: doc.data['price'],
      );
    }).toList();
  }
}