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

  @override
  String toString() {
    return 'AppState{loginSession: ${json.encode(loginSession)}, userInfo: ${json.encode(userInfo)}}';
  }
}