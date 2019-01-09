import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:demo/models/product/merchant_info.dart';
import 'package:demo/models/app_state.dart';

class MerchantList extends StatefulWidget{

  MerchantList({Key key, this.merchantList, this.cityName}):super(key: key);

  List<MerchantInfo> merchantList;

  String cityName;

  @override
  State<StatefulWidget> createState() {
    return MerchantListState();
  }

}
// 页面的主要的展示
class MerchantListState extends State<MerchantList>{

  /**
   * 每个商户前端展示
   */
  Widget merchantItem(MerchantInfo record){
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(
                  record.imageUrl,
                  width: 500,
                  fit:BoxFit.fitWidth
              ),
              new Positioned(
                left: 20.0,
                top: 35.0,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        record.merchantName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromRGBO(120,205,202,1)
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: (){

                      },
                      color: Color.fromRGBO(120,205,202,1),
                      child: Text(
                        '立即申请',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('widget.merchantList${widget.merchantList}');
    return Container(
        padding: const EdgeInsets.all(3.0),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: widget.merchantList != null ? widget.merchantList.map((MerchantInfo record){
            return merchantItem(record);
          }).toList() : [],
        )
    );

//    return Container(
//      padding: const EdgeInsets.all(3.0),
//      child: ListView(
//        padding: const EdgeInsets.symmetric(vertical: 8.0),
//        // ignore: argument_type_not_assignable
//        children: new StoreConnector<AppState,List<MerchantInfo>> (
//            converter: (store) =>store.state.merchantList,
//            builder: (context,merchantList) {
//              merchantList != null ? merchantList.map((MerchantInfo record){
//                return merchantItem(record);
//              }).toList() : [];
//            },
//          ),
//      )
//    );
  }
}
