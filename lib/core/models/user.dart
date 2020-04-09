class User {
  final String uid;

  User({this.uid});

  User.fromMap(String id) :
    uid = id ?? '';
      
  toJson() {
    return {
      "uid": uid,
    };
  }

}