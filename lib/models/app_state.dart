import 'dart:convert';
import 'package:demo/models/user/user_info.dart';
import 'package:demo/models/user/login_session.dart';
import 'package:demo/models/product/merchant_info.dart';

/**
 * App 全局的Redux store对象，保存state信息
 */
class AppState{

  // 登录状态
  LoginSession loginSession;

  // 用户信息
  UserInfo userInfo;

  // 商户信息
  List<MerchantInfo> merchantList;

  AppState({this.loginSession,this.userInfo,this.merchantList});

  factory AppState.initState(){
    return new AppState(
        loginSession: new LoginSession(),
        userInfo: new UserInfo(),
        merchantList: <MerchantInfo>[
          MerchantInfo(merchantCode: 'M15272294210000000536', merchantName:'上海南山医院',imageUrl: 'http://cdn.yifen7.cn/yifenqi/wxapp/main/p_list_nanshan5.25.png'),
          MerchantInfo(merchantCode: 'M15349938410000000578', merchantName:'上海铭悦医美',imageUrl: 'http://cdn.yifen7.cn/yifenqi/wxapp/main/p_list_mingyue.png')
        ]
    );
  }


  Map<String, dynamic> toJson() =>{
    'loginSession': json.encode(loginSession),
    'userInfo': json.encode(userInfo)
  };

  @override
  String toString() {
    return 'AppState{loginSession: ${json.encode(loginSession)}, userInfo: ${json.encode(userInfo)}, merchantList: ${json.encode(merchantList)}';
  }
}