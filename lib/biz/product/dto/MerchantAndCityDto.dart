import 'package:demo/biz/product/dto/MerchantInfo.dart';

class MerchantAndCityDto {

  int channelId;

  String userId;

  String city;

  List<MerchantInfo> merchantInfoList;

  MerchantAndCityDto({this.channelId,this.userId,this.city,this.merchantInfoList});

  factory MerchantAndCityDto.fromJson(Map<String, dynamic> json) {

    var list = json['merchantDtoList'] as List;
    List<MerchantInfo> merchantInfoList = [];
    if(null != list && list.isNotEmpty){
      merchantInfoList = list.map((record)=> MerchantInfo.fromJson(record)).toList();
    }
    print('merchantInfoList:${merchantInfoList[0].toJson()}');

    return MerchantAndCityDto(
        channelId: json['channelId'],
        userId: json['userId'],
        city: json['city'],
        merchantInfoList: merchantInfoList
    );
  }

  Map<String, dynamic> toJson() =>{
    'channelId': channelId,
    'userId': userId,
    'city':city,
    'merchantInfoList':merchantInfoList
  };
}