import 'package:json_annotation/json_annotation.dart';
import 'package:demo/utils/ShareDataUtil.dart';

@JsonSerializable()
class LoginSession extends Object{
  int channelId;
  String userId;
  String userName;
  String phoneNumber;
  String sessionKey;
  bool isLogin = false;

  LoginSession({this.channelId,this.userId,this.userName,this.phoneNumber,this.sessionKey,this.isLogin});

  factory LoginSession.fromJson(Map<String,dynamic> json){
    return LoginSession(
      channelId: json['channelId'],
      userId: json['userId'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
      sessionKey: json['sessionKey'],
      isLogin: bool.fromEnvironment(json['isLogin'],defaultValue: false),
    );
  }

  factory LoginSession.initState(){
    Future<LoginSession> future = ShareDataUtil.getLoginInfo();
    LoginSession loginSession = LoginSession(
        channelId: null,
        userId: null,
        userName: null,
        phoneNumber:null,
        sessionKey: null,
        isLogin: false
    );
    future.then((value){
      if(null != value){
        loginSession = value;
      }
    }).catchError((error){
      print('Error${error}');
    });
    return loginSession;
  }

  Map<String, dynamic> toJson() => {
    'channelId': this.channelId,
    'userId': this.userId,
    'userName': this.userName,
    'phoneNumber': this.phoneNumber,
    'sessionKey': this.sessionKey,
    'isLogin': this.isLogin
  };
}
