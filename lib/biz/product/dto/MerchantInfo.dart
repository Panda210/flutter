class MerchantInfo{

  int channelId;
  String userId;
  String cityCode;
  String imageUrl;
  String location;
  String merchantCategory;
  int merchantId;
  String merchantCode;
  String merchantName;



  MerchantInfo({this.channelId,this.userId,this.cityCode,this.imageUrl,this.location,this.merchantCategory,this.merchantId,this.merchantCode,this.merchantName});

  factory MerchantInfo.fromJson(Map<String, dynamic> json) {
    return MerchantInfo(
      channelId: json['channelId'],
      userId: json['userId'],
      cityCode: json['cityCode'],
      imageUrl: json['imageUrl'],
      location: json['location'],
      merchantCategory: json['merchantCategory'],
      merchantId: json['merchantId'],
      merchantCode: json['merchantCode'],
      merchantName: json['merchantName']
    );
  }

  Map<String, dynamic> toJson() =>{
    'channelId': channelId,
    'userId': userId,
    'cityCode': cityCode,
    'imageUrl': imageUrl,
    'location': location,
    'merchantCategory': merchantCategory,
    'merchantId': merchantId,
    'merchantCode': merchantCode,
    'merchantName': merchantName
  };

}