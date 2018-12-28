// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Test _$TestFromJson(Map<String, dynamic> json) {
  return Test(
      channelId: json['channelId'] as int,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      sessionKey: json['sessionKey'] as String,
      isLogin: json['isLogin'] as bool);
}

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'channelId': instance.channelId,
      'userId': instance.userId,
      'userName': instance.userName,
      'sessionKey': instance.sessionKey,
      'isLogin': instance.isLogin
    };
