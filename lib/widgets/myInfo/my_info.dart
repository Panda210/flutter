import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:demo/models/app_state.dart';
import 'package:demo/models/user/login_session.dart';

import 'package:demo/widgets/login/login_page.dart';

class MyInfoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyInfoPageState();
  }
}

class MyInfoPageState extends State<MyInfoPage>{

  bool isLogin;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController =  new TextEditingController();

  Store<AppState> getStore(){
    return StoreProvider.of(context);
  }

  // 判断展示页面
  chargeIsLogin(Store<AppState>  store){
    LoginSession loginSession = store.state.loginSession;
    print('###loginSession:${loginSession.toJson()}');
    isLogin = loginSession.isLogin;
    if(!loginSession.isLogin){
      print('先销毁当前页面');
      deactivate();
      print('判断没有登录直接进入了登录页面');
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  void didChangeDependencies() {
    Store<AppState> store = getStore();
//    chargeIsLogin(store);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,LoginSession>(
      converter: (store) => store.state.loginSession,
      builder: (context,loginSession){
        return Scaffold(
            appBar: AppBar(
              title: new Text('个人中心'),
            ),
            body: new Container(
              color: Colors.black12,
              child: Center(
                child: Card(
                  elevation: 5.0,
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  color: Colors.white,
                  margin: const EdgeInsets.only(left:30.0, right: 30.0),
                  child: Padding(
                    padding: new EdgeInsets.only(left: 30.0, top: 30.0, right: 30.0, bottom: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            '名片',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 32
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: loginSession.userName ??  'test',
                              icon: Icon(Icons.perm_identity),
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                              )
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: TextField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                                hintText: loginSession.phoneNumber ??  '18621841989',
                                icon: Icon(Icons.phone),
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20
                                )
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10.0)),
                      ],
                    ),
                  )

                )
              ),
            )
        );
      },
    );
  }
}