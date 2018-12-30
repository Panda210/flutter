import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo/models/common/Result.dart';


String host = 'http://wechat-api-dev.yifen7.cn/';

Future<Result> commonRequest(String path, String requestBody) async{
  Result result = new Result();
  try{
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map<String, dynamic> headers = {
//      'Session-Key': sp.getString(LoginConstant.SESSION_KEY)
      'Session-Key': '4258fda85eac4f7eb911100878fd6edb'
    };
    Options options= new Options(
      baseUrl: host,
      headers: headers,
      path: path,
      method: 'POST',
      responseType:ResponseType.JSON
    );
    Dio dio = new Dio();
    print('send commonRequest：baseURL:${options.baseUrl}，path:${options.path}，method=${options.method}');
    var response= await dio.post(path, data:requestBody, options: options);
    print('send commonRequest result:${response.data}');
    Map resultData = response.data ;
    result = Result.fromJson(resultData);
    print('result:${result}');
    return result;
  }catch(exception){
    print(exception.toString());
    return result.setErrorMsg(result, "请求失败");
  }
}