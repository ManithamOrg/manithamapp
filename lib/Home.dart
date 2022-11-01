

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'Controller/EducationContent.dart';
import 'Controller/EnvironmentContent.dart';
import 'Controller/SocialAwarenessContent.dart';
import 'Controller/WorkWithChildrenContent.dart';
import 'HomePostDetails.dart';
import 'package:manithamapp/Controller/EducationContent.dart';
import 'package:manithamapp/Controller/EnvironmentContent.dart';
import 'package:manithamapp/Controller/SocialAwarenessContent.dart';
import 'package:manithamapp/Controller/WorkWithChildrenContent.dart';
import 'package:firebase_app_check/firebase_app_check.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot>snapshot;
  CollectionReference collectionReference=Firestore.instance.collection("post");
  @override
  void initState() {

    subscription=collectionReference.snapshots().listen((datasnap){

      setState(() {

        snapshot=datasnap.documents;

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF222240),
      appBar: new AppBar(
        title: new Text("Manitham"),
        backgroundColor: Color(0xFF222240),
      ),
      drawer: new Drawer(
        child: new Container(
          decoration: new BoxDecoration(
            color: Color(0xFF272B4A),
          ),
          child: new ListView(
            children: <Widget>[

              new UserAccountsDrawerHeader(
                accountName: new Text("Manitham App"),
                accountEmail: null,
                decoration: new BoxDecoration(
                  color: Color(0xFF222240),
                ),
              ),
              new ListTile(
                title: new Text("Education and Training",style: TextStyle(fontSize: 18.0,color: Colors.white),),
                leading: new Icon(Icons.all_inclusive,size: 20.0,color: Colors.white,),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>EducationAndTraining()));
                },
              ),
              new ListTile(
                title: new Text("Work with children",style: TextStyle(fontSize: 18.0,color: Colors.white),),
                leading: new Icon(Icons.satellite,size: 20.0,color: Colors.white,),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>WorkWithChildren()));
                },
              ),
              new ListTile(
                title: new Text("Social Awareness",style: TextStyle(fontSize: 18.0,color: Colors.white),),
                leading: new Icon(Icons.satellite,size: 20.0,color: Colors.white,),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>SocialAwareness()));
                },
              ),
              new ListTile(
                title: new Text("Environment",style: TextStyle(fontSize: 18.0,color: Colors.white),),
                leading: new Icon(Icons.satellite,size: 20.0,color: Colors.white,),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Environment()));
                },
              ),
            ],
          ),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //First Container start
          new Container(
            height: 190.0,
            margin: EdgeInsets.only(top:10.0,left: 0.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Latest Post",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white
                  ),
                  ),
                ),
                new Container(
                  height: 130.0,
                  margin: EdgeInsets.only(top:10.0),
                  child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.length,
                      itemBuilder: (context,index){
                        return Container(
                          width: 300.0,
                          margin: EdgeInsets.only(left: 10.0),
                          color: Color(0xFF272B4A),
                          child: new Row(
                            children: <Widget>[

                              new Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: new Image.network(snapshot[index].data["image"],
                                    height: 130.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              new SizedBox(width: 10.0,),
                              new Expanded(
                                flex: 2,
                                child: new Container(
                                  color: Color(0xFF272B4A),
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: (){
                                          Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>HomePageDetails(snapshot[index])));
                                        },
                                        child: new Text(snapshot[index].data["title"],
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 21.0,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                      new SizedBox(height: 10.0,),
                                      new Text(snapshot[index].data["des"],
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white
                                        ),
                                      ),
                                      new SizedBox(height: 5.0,),
                                      new Container(
                                        child: new Row(
                                          children: <Widget>[

                                            new Icon(Icons.remove_red_eye,
                                              color: Colors.orange,
                                            ),
                                            new SizedBox(width: 5.0,),
                                            new Text("View",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white
                                              ),
                                            )

                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),

                        );
                      }
                  ),

                )

              ],
            ),
          ),
          //First Container end..

          //second container start...

          new Container(
            margin: EdgeInsets.all(10.0),
            height: 150.0,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Center(
              child: Container(
                height: 350.0,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 7.0,
                  dotIncreasedColor: Colors.red,
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 7.0,
                  showIndicator: true,
                  borderRadius: true,
                  indicatorBgPadding: 10.0,
                  overlayShadow: true,
                  overlayShadowColors: Colors.black.withOpacity(0.4),
                  overlayShadowSize: 10.0,

                  images: [
                  NetworkImage("https://firebasestorage.googleapis.com/v0/b/manithamapp-c12cb.appspot.com/o/1.jpg?alt=media&token=1cc0ba82-1ac0-4bdf-878f-32c5d54dab6f");
                  NetworkImage("https://firebasestorage.googleapis.com/v0/b/manithamapp-c12cb.appspot.com/o/2.jpg?alt=media&token=1f5f3502-a2dc-45d9-b342-64dbde0329cd");
                  NetworkImage("https://firebasestorage.googleapis.com/v0/b/manithamapp-c12cb.appspot.com/o/3.jpg?alt=media&token=3656fa8f-7544-4ae8-839c-030364d39e95");
                  NetworkImage("https://firebasestorage.googleapis.com/v0/b/manithamapp-c12cb.appspot.com/o/4.jpg?alt=media&token=f1629055-ba95-4f74-a19e-24f7275c69cb");
                  NetworkImage("https://firebasestorage.googleapis.com/v0/b/manithamapp-c12cb.appspot.com/o/5.jpg?alt=media&token=10d4fd6c-e2e9-4bae-a26f-afbe218c95e6");


                  ],
                ),
              ),
            ),
          ),
          //second container end..
          //Third Container start...
          new Container(
            height: 300.0,
            margin: EdgeInsets.all(10.0),
            child: new ListView(
              children: <Widget>[
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>EducationAndTraining()));
                              },
                              child: new Text("Education and Training",
                              style: TextStyle(
                                fontSize: 19.0,
                                color: Colors.white
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      new SizedBox(width: 10.0,),
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>WorkWithChildren()));
                              },
                              child: new Text("Work with children",
                                style: TextStyle(
                                    fontSize: 19.0,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),//first container end..

                new SizedBox(height: 10.0,),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>SocialAwareness()));
                              },
                              child: new Text("Social Awareness",
                                style: TextStyle(
                                    fontSize: 19.0,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      new SizedBox(width: 10.0,),

                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),

                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Environment()));
                              },
                              child: new Text("Environment",
                                style: TextStyle(
                                    fontSize: 19.0,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),


              ],
            ),
          )


          //Third Container End....



        ],
      ),

    );
  }
}


