import 'package:demo/biz/data/mocktest.dart';
import 'package:demo/biz/data/test.dart';
import 'dart:convert';

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
  
}