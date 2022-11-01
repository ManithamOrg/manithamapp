import 'package:flutter/material.dart';
import "package:manithamapp/View/EducationAndTraining/EducationAndTraining_content.dart"
    as allContent;
import 'package:manithamapp/View/EducationAndTraining/EducationAndTraining_Gallery.dart'
    as gallery;

class EducationContent extends StatefulWidget {
  @override
  _EducationContentState createState() => new _EducationContentState();
}

class _EducationContentState extends State<EducationContent>
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
          title: new Text("Education and Training"),
          backgroundColor: Color(0xFF272B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              new Tab(
                icon: Icon(Icons.next_week),
                text: "Education and Training",
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
          new allContent.Ed_allContent(),
          new gallery.Ed_Gallery(),
        ],
      ),
    );
  }
}
