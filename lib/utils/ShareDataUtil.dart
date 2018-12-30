import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo/models/user/login_session.dart';
import 'package:demo/constants/LoginConstant.dart';

class ShareDataUtil{

  // 保存用户登录信息，data中包含了userName
  static Future saveLoginInfo(LoginSession loginSession) async {
    print('saveLoginInfo');
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setInt(LoginConstant.CHANNEL_ID, loginSession.channelId);
    await sp.setString(LoginConstant.USER_ID, loginSession.userId);
    await sp.setString(LoginConstant.USER_NAME, loginSession.userName);
    await sp.setString(LoginConstant.SESSION_KEY, loginSession.sessionKey);
    await sp.setBool(LoginConstant.IS_LOGIN, true);
  }

  // 清空缓存登录信息 - 退出登录的时候进行处理
  static Future clearLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    print('clean');
    return sp.clear();
  }

  // 获取登录用户的相关信息
  static Future<LoginSession> getLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    LoginSession loginSession = new LoginSession(
        channelId: sp.getInt(LoginConstant.CHANNEL_ID),
        userId: sp.getString(LoginConstant.USER_ID),
        userName: sp.getString(LoginConstant.USER_NAME),
        sessionKey: sp.getString(LoginConstant.SESSION_KEY),
        isLogin: sp.getBool(LoginConstant.IS_LOGIN)
    );
    return loginSession;
  }

  // 获取当前ChannelId
  static Future<int> getChannelId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(LoginConstant.CHANNEL_ID);
  }

  // 获取当前登录用户Id
  static Future<String> getUserId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(LoginConstant.USER_ID);
  }

  // 获取当前登录用户信息
  static Future<String> getUserName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(LoginConstant.USER_NAME);
  }

  // 获取当前登录用户SessionKey
  static Future<String> getSessionKey() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(LoginConstant.SESSION_KEY);
  }

  // 获取是否登录标识
  static Future<bool> isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool b = sp.getBool(LoginConstant.IS_LOGIN);
    return true == b;
  }
}