import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learner/models/activities.dart';
import 'package:learner/models/userProfile.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  
  //collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('Users');
  final CollectionReference activitiesListCollection = Firestore.instance.collection('ActivitiesList');

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

  //update user profile in profileEdit
  Future editUserProfile(String name,String birthday, String location, String occupation, String userImage) async {
    return await usersCollection.document(uid).updateData({ 
      'name': name ?? '',
      'birthday': birthday ?? '',
      'location': location ?? '',
      'occupation': occupation ?? '',
      'userImage': userImage ?? '',
    });
  }

  //add new activities 
  Future updateActivitiesList(String subject, String area, String date, String description, String location, String time, String userId, List<String> tag) async {
    return await usersCollection.document(subject).collection(area).add({
      'date': date,
      'description': description,
      'location': location,
      'time': time,
      'tag': tag,
      'userId': userId
    });
  }

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