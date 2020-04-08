class UserProfile {
  final String name;
  final int age;
  final String location;
  final String contactNumber;
  final String occupation;
  final String description;
  final bool student;
  final bool teacher;
  final String joinedIn;
  final String birthday;
  final String id;
  final String userImage;

  UserProfile({this.name, this.age, this.location, this.contactNumber, this.occupation, this.description, this.student, this.teacher, this.joinedIn, this.birthday, this.id, this.userImage});

  UserProfile.fromMap(Map snapshot, String id) :
    id = id ?? '',
    name = snapshot['name'] ?? '',
    age = snapshot['age'] ?? 0,
    location = snapshot['location'] ?? '',
    contactNumber = snapshot['contactNumber'] ?? '',
    occupation = snapshot['occupation'] ?? '',
    description = snapshot['description'] ?? '',
    student = snapshot['student'] ?? false,
    teacher = snapshot['teacher'] ?? false,
    joinedIn = snapshot['joinedIn'] ?? '',
    birthday = snapshot['birthday'] ?? '',
    userImage = snapshot['userImage'] ?? '';
      

  toJson() {
    return {
      "id": id,
      "name": name,
      "age": age,
      "location": location,
      "contactNumber": contactNumber,
      "occupation": occupation,
      "description": description,
      "student": student,
      "teacher": teacher,
      "joinedIn": joinedIn,
      "birthday": birthday,
      "userImage": userImage,
    };
  }
}  
  