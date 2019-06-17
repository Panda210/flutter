import 'dart:convert';
import 'package:demo/biz/data/mocktest.dart';
import 'package:demo/biz/data/test.dart';
import 'package:demo/models/user/login_session.dart';


/**
 * json_serialization的测试验证
 */
void main(){

  var data = json.decode(JsonString.mocktest);
  print('data.runtimeType:${data.runtimeType}');

  Test test = Test.fromJson(data);
  print('test.runtimeType:${data.runtimeType}');
  print('test.isLogin:${test.isLogin}');

  var testInfo = json.encode(test);
  print('testInfo.runtimeType:${testInfo.runtimeType}');
  print('testInfo:${testInfo}');

  LoginSession loginSession = new LoginSession();
  loginSession.channelId = 1;
  loginSession.userId = "userId";
  loginSession.userName = "userName";
  loginSession.sessionKey = "sessionKey";
  loginSession.isLogin = true;
  print('loginSession:${json.encode(loginSession)}');

}