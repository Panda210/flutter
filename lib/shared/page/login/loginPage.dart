import 'package:flutter/material.dart';
import 'package:demo/biz/common/util/CommonUtil.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController =  new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('登录页面')
        ),
        floatingActionButton: FloatingActionButton(
            child: Text('登录'),
            onPressed: null),
        body: Container(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: '请输入手机号码'
                ),
              ),
              Column(
                children: <Widget>[
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: '请设置密码'
                    ),
                    obscureText: true,
//                validator: (val){
//                  return CommonUtil.checkPasswordResult(password);
//                },
                  ),
                ],
              ),
              new RaisedButton(
                child: new Text(
                  "注册",
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                disabledColor: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  print('点击了注册按钮');
                },
              )
            ],
          ),
        )
    );
  }

}
