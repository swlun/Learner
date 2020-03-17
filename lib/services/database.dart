import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:learner/models/userProfile.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  
  //collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('Users');
  final CollectionReference activitiesListCollection = Firestore.instance.collection('ActivitiesList');

  final FirebaseStorage storage = FirebaseStorage(storageBucket: 'gs://mal-db.appspot.com');

  //register with email and password
  Future updateUserData(String name, int age, String location, String contactNumber, String occupation, String description, bool student, bool teacher, String birthday, String joinedIn, String userImage) async {
    return await usersCollection.document(uid).setData({ 
      'name': name,
      'age': age,
      'birthday': birthday,
      'location': location,
      'contactNumber': contactNumber,
      'occupation': occupation,
      'description': description,
      'student': student,
      'teacher': teacher,
      'joinedIn': joinedIn,
      'userImage': userImage,
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
        age: doc.data['age'] ?? 0,
        location: doc.data['location'] ?? '',
        birthday: doc.data['birthday'] ?? '',
        contactNumber: doc.data['contactNumber'] ?? '',
        occupation: doc.data['occupation'] ?? '',
        description: doc.data['description'] ?? '',
        student: doc.data['student'] ?? '',
        teacher: doc.data['teacher'] ?? '',
      );
    }).toList();
  }

  Future<UserProfile> get userProfile async {
    final profile = await usersCollection.document(this.uid).get();

    return UserProfile(
      id: this.uid,
      name: profile.data['name'] ?? '',
      age: profile.data['age'] ?? 0,
      birthday: profile.data['birthday'] ?? '',
      location: profile.data['location'] ?? '',
      contactNumber: profile.data['contactNumber'] ?? '',
      occupation: profile.data['occupation'] ?? '',
      description: profile.data['description'] ?? '',
      student: profile.data['student'] ?? '',
      teacher: profile.data['teacher'] ?? '',
      joinedIn: profile.data['joinedIn'] ?? '',
      userImage: profile.data['userImage'] ?? '',
    );
  }
}