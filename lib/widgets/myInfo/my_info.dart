import 'package:flutter/material.dart';

class MyInfoPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('我'),
      ),
      body: new Container(
        color: Colors.black12,
        child: new Text('个人中心'),
      )
    );
  }
}