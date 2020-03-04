import 'package:firebase_auth/firebase_auth.dart';
import 'package:learner/models/user.dart';
import 'package:learner/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth user change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anonymous
  Future signInAnonymous() async {
    try {
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

   //sign in with email & password
   Future signInWithEmailAndPassword(String email, String password) async {
     try{ 
       AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
       FirebaseUser user = result.user;
       return _userFromFirebaseUser(user);
     }
     catch(e) {
       print(e);
       return null;
     }
   }

   //register with email & password
   Future registerWithEmailAndPassword(String email, String password) async {
     try{ 
       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
       FirebaseUser user = result.user;

       //cfreate a new document for the user with uid
       await DatabaseService(uid: user.uid).updateUserData('', 0, '', '', '', '', false, false);
       return _userFromFirebaseUser(user);
     }
     catch(e) {
       print(e);
       return null;
     }
   }

   //sign out
   Future signOut() async {
     try{
       return await _auth.signOut();
     }
     catch(e) {
        print(e.toString());
        return null;
     }
   }
}