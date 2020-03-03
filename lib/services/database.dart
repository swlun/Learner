import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  //collection reference
  final CollectionReference activitiesCollection = Firestore.instance.collection('ActivitiesList');

  Future updateUserData(String name, String age, String location, String contractNumber, String occupation, String description, bool student, bool teacher) {
    
  }
}