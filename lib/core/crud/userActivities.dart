import 'package:cloud_firestore/cloud_firestore.dart';

class UserActivities{

  final String uid;
  UserActivities({this.uid});
  
  //collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('Users');
  final CollectionReference activitiesListCollection = Firestore.instance.collection('ActivitiesList');

  //add new activities 
  Future addActivity(String subject, String area, String date, String description, String location, String time, String userId, List<String> tag) async {
    return await usersCollection.document(subject).collection(area).add({
      'date': date,
      'description': description,
      'location': location,
      'time': time,
      'tag': tag,
      'userId': userId
    });
  }
  
}