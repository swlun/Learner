import 'package:flutter/material.dart';
import 'package:learner/core/crud/activitiesListCRUD.dart';
import 'package:learner/core/models/activities.dart';
import 'package:learner/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Activities>>.value(
      value: ActivitiesListCRUD().activitiesList,
      child:
          Consumer<List<Activities>>(builder: (context, activitiesList, child) {
        return activitiesList == null
            ? Loading()
            : Container(
                padding: EdgeInsets.zero,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: activitiesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 3,
                        child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(activitiesList[index].description),
                                subtitle: Text(activitiesList[index].location),
                                trailing: Text(
                                  'RM' + activitiesList[index].price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 20),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:
                                        Text(activitiesList[index].tag.join(', '))),
                              ),
                            ],
                          ),
                      );
                    }));
      }),
    );
  }
}
