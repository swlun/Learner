import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learner/core/models/userProfile.dart';
import 'package:learner/core/services/database.dart';
import 'package:learner/ui/widgets/loading.dart';

class ProfileEdit extends StatefulWidget {
  final UserProfile userProfile;
  ProfileEdit({this.userProfile});

  @override
  State<StatefulWidget> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();
  File _image;
  String _name, _location, _occupation, _birthday, _imageUrl;

  @override
  Widget build(BuildContext context) {
    return widget.userProfile == null
        ? Loading()
        : Material(
            child: Scaffold(
                //backgroundColor: Colors.white,
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
                            var uploaded = await saveForm();
                            if(uploaded) {
                              Navigator.pop(context);
                            }
                          },
                          icon: Icon(Icons.save),
                          label: Text('Save')),
                    ]),
                body: Builder(
                    builder: (context) => Container(
                        margin: EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
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
                                                    ? ((widget.userProfile
                                                                .userImage ==
                                                            '')
                                                        ? Image(
                                                            image: new AssetImage(
                                                                "assets/images/profile_background.jpeg"),
                                                            fit: BoxFit.fill,
                                                          )
                                                        : Image.network(
                                                            widget.userProfile
                                                                .userImage,
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
                                    initialValue: '${widget.userProfile.name}',
                                    decoration: const InputDecoration(
                                      labelText: 'Name',
                                      hintText: 'Please insert your name',
                                    ),
                                    validator: (input) => input.isEmpty ? 'Name can not be empty' : null,
                                    onSaved: (input) { _name = input; print('input: ' + _name);}
                                  ),
                                  TextFormField(
                                    initialValue:
                                        '${widget.userProfile.birthday}',
                                    decoration: const InputDecoration(
                                      labelText: 'Birthday',
                                      hintText: 'e.g. 01/04/1964',
                                    ),
                                    onSaved: (input) => _birthday = input,
                                  ),
                                  TextFormField(
                                    initialValue:
                                        '${widget.userProfile.location}',
                                    decoration: const InputDecoration(
                                      labelText: 'Location',
                                      hintText:
                                          'e.g. Kuala Lumpur / Penang / Johor',
                                    ),
                                    onSaved: (input) => _location = input,
                                  ),
                                  TextFormField(
                                    initialValue:
                                        '${widget.userProfile.occupation}',
                                    decoration: const InputDecoration(
                                      labelText: 'Occupation',
                                      hintText:
                                          'e.g. Teacher / Student / Engineer',
                                    ),
                                    onSaved: (input) => _occupation = input,
                                  ),
                                ]),
                          ),
                        )))));
  }

  Future<bool> saveForm() async {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      updateProfile(context);
    }

    return _formKey.currentState.validate();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path: $_image');
    });
  }

  Future updateProfile(BuildContext context) async {
    String fileName = 'userImage_${widget.userProfile.id}';
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);

    if (_image != null) {
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      var storageUrl = await taskSnapshot.ref.getDownloadURL();
      _imageUrl = storageUrl.toString();
    }
    else {
      _imageUrl = widget.userProfile.userImage;
    }

    DatabaseService(uid: widget.userProfile.id)
        .editUserProfile(_name, _birthday, _location, _occupation, _imageUrl);
  }
}

String getJoinMonth(String userJoinIn) {
  return userJoinIn.substring(0, userJoinIn.length - 4);
}

String getJoinYear(String userJoinIn) {
  return userJoinIn.substring(userJoinIn.length - 4, userJoinIn.length);
}
