import 'package:flutter/material.dart';
import "package:manithamapp/View/Environment/Environment_content.dart"
    as allContent;
import 'package:manithamapp/View/Environment/Environment_Gallery.dart'
    as gallery;

class EnvironmentContent extends StatefulWidget {
  @override
  _EnvironmentContentState createState() => new _EnvironmentContentState();
}

class _EnvironmentContentState extends State<EnvironmentContent>
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
          title: new Text("Environment"),
          backgroundColor: Color(0xFF272B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              new Tab(
                icon: Icon(Icons.next_week),
                text: "Environment",
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
          new allContent.EV_allContent(),
          new gallery.EV_Gallery(),
        ],
      ),
    );
  }
}
