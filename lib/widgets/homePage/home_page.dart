import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:demo/controllers/product.dart';

import 'package:demo/models/app_state.dart';
import 'package:demo/models/product/merchant_info.dart';

import 'package:demo/widgets/homePage/merchant_list.dart';

class HomePage extends StatefulWidget{

  @override
  State createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage>, WidgetsBindingObserver {

  List<MerchantInfo> merchantList;

  Store<AppState> getStore(){
    return StoreProvider.of(context);
  }

  @override
  void initState() {
    print('### homePage initState');
    super.initState();
  }


  @override
  void didChangeDependencies() {
    print('### didChangeDependencies');
    queryMerchantList(getStore());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,List<MerchantInfo>>(
      converter: (store) => store.state.merchantList,
      builder: (context, merchantList){
        return Scaffold(
            appBar: AppBar(
              title: Text('首页'),
            ),
//            body: Container(
//              child: new Text('数量'),
//            )
            body: MerchantList(
              cityName:'上海',
              merchantList: merchantList,
            )
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

}