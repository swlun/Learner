import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learner/models/userProfile.dart';
import 'package:learner/services/database.dart';
import 'package:learner/shared/loading.dart';

class ProfileEdit extends StatefulWidget {
  final UserProfile user;
  ProfileEdit({this.user});

  @override
  State<StatefulWidget> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  File _image;

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path: $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = 'userImage_${widget.user.id}';
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      var storageUrl = await taskSnapshot.ref.getDownloadURL();
      String url = storageUrl.toString();
      print(url);

      DatabaseService(uid: widget.user.id)
          .editUserProfile('test', '01/01/2001', 'Kuala Lumpur, Malaysia', url);
    }

    return widget.user == null
        ? Loading()
        : Material(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                    leading: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    title: Text('Edit Profile'),
                    actions: <Widget>[
                      FlatButton.icon(
                          onPressed: () async {
                            var uploaded = await uploadPic(context);
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.save),
                          label: Text('Save')),
                    ]),
                body: Builder(
                    builder: (context) => Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                        radius: 100,
                                        backgroundColor: Colors.blueAccent,
                                        child: ClipOval(
                                          child: new SizedBox(
                                              width: 180.0,
                                              height: 180.0,
                                              child: (_image == null)
                                                  ? ((widget.user.userImage ==
                                                          '')
                                                      ? Image(
                                                          image: new AssetImage(
                                                              "assets/images/profile_background.jpeg"),
                                                          fit: BoxFit.fill,
                                                        )
                                                      : Image.network(
                                                          widget.user.userImage,
                                                          fit: BoxFit.fill,
                                                        ))
                                                  : Image.file(
                                                      _image,
                                                      fit: BoxFit.fill,
                                                    )),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 60.0),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.camera,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          getImage();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  initialValue: '${widget.user.name}',
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                    hintText: 'Please insert your name',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  initialValue: '${widget.user.location}',
                                  decoration: const InputDecoration(
                                    labelText: 'Location',
                                    hintText: 'e.g. Kuala Lumpur / Penang / Johor',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your location';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  initialValue: '${widget.user.occupation}',
                                  decoration: const InputDecoration(
                                    labelText: 'Occupation',
                                    hintText: 'e.g. Teacher / Student / Engineer',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your occupation';
                                    }
                                    return null;
                                  },
                                ),
                                // TextFormField(
                                //   initialValue: '${widget.user.}',
                                //   decoration: const InputDecoration(
                                //     labelText: 'Languages',
                                //     hintText: 'Please insert your languages',
                                //   ),
                                //   validator: (value) {
                                //     if (value.isEmpty) {
                                //       return 'Please enter your languages';
                                //     }
                                //     return null;
                                //   },
                                // ),
                              ]),
                        ))));
  }
}

String getJoinMonth(String userJoinIn) {
  return userJoinIn.substring(0, userJoinIn.length - 4);
}

String getJoinYear(String userJoinIn) {
  return userJoinIn.substring(userJoinIn.length - 4, userJoinIn.length);
}
