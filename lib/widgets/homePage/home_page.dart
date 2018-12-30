import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:demo/widgets/homePage/merchant_list.dart';
import 'package:demo/models/app_state.dart';
import 'package:demo/models/user/login_session.dart';
import 'package:demo/models/user/user_info.dart';
import 'package:demo/reducers/app_state_reducer.dart';
import 'package:demo/actions/product/action.dart';


class HomePage extends StatefulWidget{

  @override
  State createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  
  final Store<AppState> store = new Store<AppState>(
    appReducer,
    initialState: new AppState(
      loginSession: new LoginSession(),
      userInfo: new UserInfo(),
      merchantList: []
    )
  );


  @override
  void initState() {
    print('######### 进来了吗');
    store.dispatch(QueryMerchantListAction());
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new StoreBuilder<AppState>(builder: (context,store){
        return Scaffold(
            appBar: AppBar(
              title: Text('首页'),
            ),
            body: MerchantList(
              cityName:'上海',
              merchantList: store.state.merchantList,
            )
        );
      })
        
//       child: StoreConnector(builder:(context, store) {
//         return Scaffold(
//            appBar: AppBar(
//              title: Text('首页'),
//            ),
//            body: MerchantList(
//              cityName:'上海',
//              merchantList: store.state.merchantList,
//            )
//        );
//       }, converter: (store){
//         return store.state;
//       }),
    );

  }

}