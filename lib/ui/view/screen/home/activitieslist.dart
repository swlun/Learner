import 'package:flutter/material.dart';
import 'package:learner/core/crud/userProfileCRUD.dart';
import 'package:learner/core/models/activities.dart';
import 'package:learner/core/models/user.dart';
import 'package:learner/core/models/userProfile.dart';
import 'package:learner/ui/view/screen/home/addFavourite.dart';
import 'package:learner/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

class ActivitiesList extends StatefulWidget {
  @override
  _ActivitiesListState createState() => _ActivitiesListState();
}

class _ActivitiesListState extends State<ActivitiesList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final userProfile = Provider.of<UserProfile>(context);
    final activitiesList = Provider.of<List<Activities>>(context);
    final List<String> favouriteList = userProfile.favourites;
  
    return activitiesList.length == 0
        ? Loading()
        : Container(
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: activitiesList.length,
                itemBuilder: (BuildContext context, int index) {
                  Activities currentActivities = activitiesList[index];
                  return Card(
                    elevation: 3,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: ListTile(
                            onTap: () {
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AddFavourite(
                                      currentActivity: currentActivities,
                                    );
                                  }).then((val) {
                                if (val != null) {
                                  if (val) {
                                    SnackBar hint = SnackBar(
                                      content: Text('New Event Added'),
                                    );
                                    Scaffold.of(context).showSnackBar(hint);
                                  } else {
                                    SnackBar hint = SnackBar(
                                      content: Text(
                                          'Event Not Added, Please Try Again.'),
                                    );
                                    Scaffold.of(context).showSnackBar(hint);
                                  }
                                }
                              });
                            },
                            title: Row(
                              children: <Widget>[
                                Text(
                                  currentActivities.title,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'RM' + currentActivities.price,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      currentActivities.location,
                                    )),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      currentActivities.address,
                                    )),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        currentActivities.description,
                                      )),
                                ),
                                Divider(),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Date: ' + currentActivities.date)),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('time: ' +
                                        currentActivities.startTime +
                                        '  ~  ' +
                                        currentActivities.endTime)),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, bottom: 10.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(currentActivities.tag)),
                            ),
                            Spacer(),
                            MaterialButton(
                              splashColor: Colors.transparent,
                              child:
                                  favouriteList.contains(currentActivities.id)
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 20.0,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          size: 20.0,
                                        ),
                              onPressed: () {
                                favouriteList.contains(currentActivities.id)
                                    ? favouriteList.removeWhere(
                                        (id) => id == currentActivities.id)
                                    : favouriteList.add(currentActivities.id);
                                UserProfileCRUD(uid: user.uid)
                                    .addFavourite(favouriteList);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }));
  }
}
