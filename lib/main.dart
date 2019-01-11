import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:demo/models/app_state.dart';
import 'package:demo/reducers/app_state_reducer.dart';
import 'package:demo/middleware/middleware.dart';

import 'package:demo/models/user/login_session.dart';

import 'package:demo/widgets/homePage/home_page.dart';
import 'package:demo/widgets/myInfo/my_info.dart';
import 'package:demo/widgets/activity/activityPage.dart';
import 'package:demo/widgets/login/login_page.dart';

void main() {
//  debugPaintSizeEnabled = true;

  final Store<AppState> store = new Store<AppState>(
    appReducer,
    initialState: AppState.initState(),
    middleware: [
      loggingMiddleware
    ]
  );

  print('### store,${store.state}');
  runApp(MyApp(store));
}


class MyApp extends StatelessWidget{

  final Store<AppState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: StoreBuilder<AppState>(builder: (context,store){
        return new MaterialApp(
            title: '禾下',
            home: new MyRootPage()
        );
      }));
    
  }

}

// App应用 主页入口
class MyRootPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyRootPageState();
  }
}

class MyRootPageState extends State<MyRootPage> with SingleTickerProviderStateMixin{

  TabController controller;

  Store<AppState> getStore(){
    return StoreProvider.of(context);
  }

  // 初始化state信息
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
  void reassemble() {
    print('调用了reassemble');
    super.reassemble();
  }

  // 判断展示页面
  showLoginPage(Store<AppState>  store){
    LoginSession loginSession = store.state.loginSession;
    print('###loginSession:${loginSession.toJson()}');
    if(loginSession.isLogin){
      print('进入了个人中心页面');
      return new MyInfoPage();
    }else{
      print('进入了登录页面');
      return new LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new TabBarView(
//          controller:  controller,
//          children: <Widget>[
//            new HomePage(),
//            new ActivityPage(),
//            new MyInfoPage()
//          ]),
//      bottomNavigationBar: new Material(
//        color: Colors.orangeAccent,
//        child: new TabBar(
//            controller: controller,
//            tabs: <Tab>[
//              new Tab(text:'首页',icon: new Icon(Icons.home)),
//              new Tab(text:'活动',icon: new Icon(Icons.search)),
//              new Tab(text:'我的',icon: new Icon(Icons.account_circle))
//            ]),
//      ),
//    );
    return new StoreConnector<AppState, Store<AppState>>(
      ///通过 converter 将 GSYState 中的 userInfo返回
      converter: (store) => store,
      ///在 userInfo 中返回实际渲染的控件
      builder: (context, store) {
        print('####store.state:${store.state}');
        return new Scaffold(
          body: new TabBarView(
              controller:  controller,
              children: <Widget>[
                new HomePage(),
                new ActivityPage(),
                showLoginPage(store)
//                new MyInfoPage()
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
    );
  }

}










