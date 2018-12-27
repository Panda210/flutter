import 'package:flutter/material.dart';
import 'package:demo/shared/page/homePage/merchantList.dart';
import 'package:demo/biz/product/dto/MerchantRequestDto.dart';
import 'package:demo/biz/product/controller/MerchantController.dart';

class HomePage extends StatefulWidget{

  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: MerchantList(
        cityName:'上海',
        merchantList: queryMerchantList(),
      )
    );
  }

}