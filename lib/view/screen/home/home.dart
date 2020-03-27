import 'package:flutter/material.dart';
import 'package:learner/models/activities.dart';
import 'package:learner/services/database.dart';
import 'package:learner/shared/loading.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Activities>>.value(
        value: DatabaseService().activitiesList,
        child: Consumer<List<Activities>>(
            builder: (context, activitiesList, child) {
          return activitiesList == null
              ? Loading()
              : Container(
                  padding: EdgeInsets.zero,
                  width: double.maxFinite,
                  child: ListView.separated(
                      itemCount: activitiesList.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            elevation: 3,
                            child: Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: ListTile(
                                    title:
                                        Text(activitiesList[index].description),
                                    trailing: cardListPrice(
                                        activitiesList[index].price),
                                    subtitle: Column(children: <Widget>[
                                      // Row(
                                      //   children: <Widget>[
                                          //     cardListTitleAndLocation(
                                          //         activitiesList[index].description,
                                          //         activitiesList[index].location),
                                          //     Spacer(),

                                          //   ],
                                          // ),
                                          //Divider(),
                                          cardListAmount(activitiesList[index]
                                              .tag
                                              .join(', ')),
                                        // ],
                                      // ),
                                    ]))));
                      }),
                );
        }));
  }
}

Widget cardListTitleAndLocation(String description, String location) {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        text: description,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: '\n$location',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget cardListPrice(String price) {
  return Align(
    alignment: Alignment.topRight,
    child: RichText(
      text: TextSpan(
        text: 'RM$price',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
        // children: <TextSpan>[
        //   TextSpan(
        //       text: '\n+202.835',
        //       style: TextStyle(
        //           color: Colors.green,
        //           fontSize: 15,
        //           fontWeight: FontWeight.bold)),
        // ],
      ),
    ),
  );
}

Widget cardListAmount(String tag) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: <Widget>[
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: tag,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              // children: <TextSpan>[
              //   TextSpan(
              //       text: '\n0.1349',
              //       style: TextStyle(
              //           color: Colors.grey,
              //           fontStyle: FontStyle.italic,
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold)),
              // ],
            ),
          ),
        ],
      ),
    ),
  );
}
