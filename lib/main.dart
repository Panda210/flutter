import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:demo/shared/page/homePage/homePage.dart';
import 'package:demo/shared/page/myInfo/myInfo.dart';
import 'package:demo/shared/page/activity/activityPage.dart';

void main(){
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '禾下',
      home: new MyHomePage()
    );
  }

}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState(){
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        controller:  controller,
          children: <Widget>[
            new HomePage(),
            new ActivityPage(),
            new MyInfoPage()
          ]),
      bottomNavigationBar: new Material(
        color: Colors.orangeAccent,
        child: new TabBar(
            controller: controller,
            tabs: <Tab>[
              new Tab(text:'首页',icon: new Icon(Icons.home)),
              new Tab(text:'活动',icon: new Icon(Icons.search)),
              new Tab(text:'我的',icon: new Icon(Icons.account_circle))
            ]),
      ),
    );
  }

}