import 'package:demo/models/product/merchant_info.dart';

class MerchantAndCityDto {

  int channelId;

  String userId;

  String city;

  List<MerchantInfo> merchantList;

  MerchantAndCityDto({this.channelId,this.userId,this.city,this.merchantList});

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
        merchantList: merchantInfoList
    );
  }

  Map<String, dynamic> toJson() =>{
    'channelId': channelId,
    'userId': userId,
    'city':city,
    'merchantInfoList':merchantList
  };
}