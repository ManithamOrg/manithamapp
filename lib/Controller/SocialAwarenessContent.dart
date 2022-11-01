import 'package:flutter/material.dart';
import "package:manithamapp/View/SocialAwareness/SocialAwareness_content.dart"
    as allContent;
import 'package:manithamapp/View/SocialAwareness/SocialAwareness_Gallery.dart'
    as gallery;


class SocialAwarenessContent extends StatefulWidget {
  @override
  _SocialAwarenessContentState createState() => new _SocialAwarenessContentState();
}

class _SocialAwarenessContentState extends State<SocialAwarenessContent>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Social Awareness"),
          backgroundColor: Color(0xFF272B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              new Tab(
                icon: Icon(Icons.next_week),
                text: "Social Awareness",
              ),
              new Tab(
                icon: Icon(Icons.image),
                text: "Gallery",
              )
            ],
          )),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new allContent.SA_allContent(),
          new gallery.SA_Gallery(),
        ],
      ),
    );
  }
}
