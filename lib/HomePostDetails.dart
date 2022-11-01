/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class LatestPostDetails extends StatefulWidget {
  DocumentSnapshot snapshot;
  LatestPostDetails(this.snapshot);

  @override
  State<LatestPostDetails> createState() => _LatestPostDetailsState();
}

class _LatestPostDetailsState extends State<LatestPostDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Latest Post Details"),
        backgroundColor: Colors.white10,
      ),
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(10.0),
            height: 250.0,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: new Image.network(
                widget.snapshot.data["image"],
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //first container end
          new SizedBox(
            height: 6.0,
          ),
          new Container(
            color: Colors.white10,
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(10.0),
                  height: 150.0,
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new CircleAvatar(
                        child: new Text(
                          widget.snapshot.data["title"][0],
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        backgroundColor: Colors.white10,
                      ),
                      new SizedBox(width: 10.0),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: new Text(
                          widget.snapshot.data["title"],
                          style: TextStyle(
                            fontSize: 19.0,
                            color: Color(0xFF222280),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                ),
              ],
            ),
          ),

          new SizedBox(
            height: 10.0,
          ),
          new Text(widget.snapshot.data["content"]),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageDetails extends StatefulWidget {
  DocumentSnapshot snapshot;

  HomePageDetails(this.snapshot);

  @override
  _HomePageDetailsState createState() => new _HomePageDetailsState();
}

class _HomePageDetailsState extends State<HomePageDetails> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Latest Post Details"),
        backgroundColor: Color(0xFF222240),
      ),
      backgroundColor: Color(0xFF222240),

      body: new ListView(
        children: <Widget>[

          //start first container..
          new Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: new Image.network(widget.snapshot.data["image"],
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //end first container..

          new Container(
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            color: Color(0xFF272B4A),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                //first container...
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      new CircleAvatar(
                        child: new Text(widget.snapshot.data["title"][0]),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepOrange,
                      ),
                      new SizedBox(width: 8.0,),

                      new Container(
                          width: MediaQuery.of(context).size.width/1.3,
                          child:new Text(widget.snapshot.data["title"],
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white
                            ),
                          )

                      )

                    ],
                  ),
                ),//end of first container
                new SizedBox(height: 10.0,),

                new Text(widget.snapshot.data["des"],
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),


        ],
      ),

    );
  }

}



