import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Ed_Gallery extends StatefulWidget {
  @override
  _Ed_GalleryState createState() => new _Ed_GalleryState();
}

class _Ed_GalleryState extends State<Ed_Gallery> {
  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      Firestore.instance.collection("EducationAndTraining");

  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnap) {
      setState(() {
        snapshot = datasnap.documents;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF222240),
      body: new ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              child: new Stack(
                children: <Widget>[
                  new Container(
                    child: new ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: new Image.network(
                        snapshot[index].data["image"],
                        height: 300.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  new Positioned(
                    top: 40.0,
                    left: 30.0,
                    child: new Container(
                      height: 50.0,
                      width: 250.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0))),
                      child: Align(
                          alignment: Alignment.center,
                          child: new Text(
                            "Education and Training",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
