import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:learner/core/models/userProfile.dart';

class UserProfileCRUD extends ChangeNotifier {
  final String uid;
  UserProfileCRUD({this.uid});

  //collection reference
  final CollectionReference usersCollection =
      Firestore.instance.collection('Users');

  //register with email and password
  Future updateUserData(
      String name,
      int age,
      String location,
      String contactNumber,
      String occupation,
      String description,
      bool student,
      bool teacher,
      String birthday,
      String joinedIn,
      String userImage) async {
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
      'favourites': new List<String>(),
      'teacherPending': new List<String>(),
      'teacherDone': new List<String>()
    });
  }

  //get user profile
  Future<UserProfile> get userProfile async {
    final profile = await usersCollection.document(this.uid).get();

    return UserProfile.fromMap(profile.data, this.uid);
  }

  //stream data
  Stream<UserProfile> get userProfileStream {
    final profile = usersCollection
        .document(this.uid)
        .snapshots()
        .map((val) => UserProfile.fromMap(val.data, this.uid));

    return profile;
  }

  //update user profile in profileEdit
  Future editUserProfile(String name, String birthday, String location,
      String occupation, String userImage) async {
    return await usersCollection.document(this.uid).updateData({
      'name': name ?? '',
      'birthday': birthday ?? '',
      'location': location ?? '',
      'occupation': occupation ?? '',
      'userImage': userImage ?? '',
    });
  }

  // update user favourite
   Future<void> addFavourite( List<String> favouriteId) {

     return usersCollection.document(this.uid).updateData({
       'favourites': favouriteId
     });
   }
}
