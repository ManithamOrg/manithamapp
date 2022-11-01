import 'package:flutter/material.dart';
import "package:manithamapp/View/WorkWithChildren/WorkWithChildren_content.dart"
    as allContent;
import 'package:manithamapp/View/WorkWithChildren/WorkWithChildren_Gallery.dart'
    as gallery;

class WorkWithChildrenContent extends StatefulWidget {
  @override
  _WorkWithChildrenContentState createState() =>
      new _WorkWithChildrenContentState();
}

class _WorkWithChildrenContentState extends State<WorkWithChildrenContent>
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
          title: new Text("WorkWithChildren"),
          backgroundColor: Color(0xFF272B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              new Tab(
                icon: Icon(Icons.next_week),
                text: "WorkWithChildren",
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
          new allContent.WC_allContent(),
          new gallery.WC_Gallery(),
        ],
      ),
    );
  }
}
