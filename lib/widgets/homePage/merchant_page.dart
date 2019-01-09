import 'package:flutter/material.dart';
import 'package:demo/models/product/merchant_info.dart';
import 'package:demo/widgets/homePage/merchant_list.dart';


class MerchantPage extends StatelessWidget{

  List<MerchantInfo> merchantList;

  MerchantPage({this.merchantList});

  @override
  Widget build(BuildContext context) {
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
  }

}