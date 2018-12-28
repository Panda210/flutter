import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {
  int channelId;
  String userId;
  String userName;
  String sessionKey;
  bool isLogin;

  Test({this.channelId,this.userId,this.userName,this.sessionKey,this.isLogin});

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}
