import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginSession {
  int channelId;
  String userId;
  String userName;
  String sessionKey;
  bool isLogin;

  LoginSession({this.channelId,this.userId,this.userName,this.sessionKey,this.isLogin});

  factory LoginSession.fromJson(Map<String,dynamic> json){
    return LoginSession(
      channelId: json['channelId'],
      userId: json['userId'],
      userName: json['userName'],
      sessionKey: json['sessionKey'],
      isLogin: json['isLogin'],
    );
  }

  Map<String, dynamic> toJson() => {
    'channelId': this.channelId,
    'userId': this.userId,
    'userName': this.userName,
    'sessionKey': this.sessionKey,
    'isLogin': this.isLogin
  };
}
