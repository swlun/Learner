import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learner/models/user_profile.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  
  //collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('Users');
  final CollectionReference activitiesListCollection = Firestore.instance.collection('ActivitiesList');

  //register with email and password
  Future updateUserData(String name, int age, String location, String contactNumber, String occupation, String description, bool student, bool teacher) async {
    return await usersCollection.document(uid).setData({
      'name': name,
      'age': age,
      'location': location,
      'contactNumber': contactNumber,
      'occupation': occupation,
      'description': description,
      'student': student,
      'teacher': teacher
    });
  }

  //add new activities 
  Future updateActivitiesList(String subject, String area, String date, String description, String location, String time, String userId, List<String> tag) async {
    return await usersCollection.document(subject).collection('area').add({
      'date': date,
      'description': description,
      'location': location,
      'time': time,
      'tag': tag,
      'userId': userId
    });
  }

  //get activities stream
  Stream<List<UserProfile>> get users {
    return usersCollection.snapshots()
      .map(_userListFromSnapshot);
  }

  //get user list from snapshot
  List<UserProfile> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserProfile(
        name: doc.data['name'] ?? '',
        age: doc.data['age'] ?? '',
        location: doc.data['location'] ?? '',
        contactNumber: doc.data['contactNumber'] ?? '',
        occupation: doc.data['occupation'] ?? '',
        description: doc.data['description'] ?? '',
        student: doc.data['student'] ?? '',
        teacher: doc.data['teacher'] ?? '',
      );
    }).toList();
  }

  //user detail change stream
  // Stream<UserProfile> get userProfile {
  //   return _userDetailsFromSnapshot(user)
  // }

  // //get user details
  // UserProfile _userDetailsFromSnapshot(QuerySnapshot snapshot, User user) {
  //   //usersCollection.document(user.uid).snapshots()
  //   snapshot.documents.map((doc)
  //     .listen((doc) {
  //       return UserProfile (
  //         name: doc.data['name'] ?? '',
  //         age: doc.data['age'] ?? '',
  //         location: doc.data['location'] ?? '',
  //         contactNumber: doc.data['contactNumber'] ?? '',
  //         occupation: doc.data['occupation'] ?? '',
  //         description: doc.data['description'] ?? '',
  //         student: doc.data['student'] ?? '',
  //         teacher: doc.data['teacher'] ?? '',
  //       ); 
  //   }); 
  // }

  
}