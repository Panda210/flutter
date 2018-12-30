import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('活动'),
      ),
      body: new Container(
        color: Colors.black12,
        child: new Text('活动列表'),
      )
    );
  }
  
}