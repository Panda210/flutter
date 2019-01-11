import 'package:flutter/material.dart';

// 错误提示框
showErrorDialog(BuildContext context, String message){
  NavigatorState navigator= context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
  print("navigator is null?"+(navigator==null).toString());

  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.error,
                color: Colors.red,
              ),
              Text(
                '错误',
                style: TextStyle(
                    color: Colors.red
                ),
              ),
            ],
          ),
          content: Text(message),
          actions:<Widget>[
            new FlatButton(child:new Text("CANCEL"), onPressed: (){
              Navigator.of(context).pop();
            },),
            new FlatButton(child:new Text("OK"), onPressed: (){
              Navigator.of(context).pop();
            },)
          ]
      ));
}

// 警告提示框
showWarningDialog(BuildContext context, String message){
  NavigatorState navigator= context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
  print("navigator is null?"+(navigator==null).toString());

  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.warning,
                color: Colors.amber,
              ),
              Text(
                '警告',
                style: TextStyle(
                    color: Colors.amber
                ),
              ),
            ],
          ),
          content: Text(message),
          actions:<Widget>[
            new FlatButton(child:new Text("CANCEL"), onPressed: (){
              Navigator.of(context).pop();
            },),
            new FlatButton(child:new Text("OK"), onPressed: (){
              Navigator.of(context).pop();
            },)
          ]
      ));
}