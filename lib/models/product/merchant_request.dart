class MerchantRequestDto{
  // 渠道
  int channelId;
  // 维度-精度 位置
  String location;

  MerchantRequestDto({this.channelId,this.location});

  factory MerchantRequestDto.fromJson(Map<String, dynamic> json) {
    return MerchantRequestDto(
      channelId: json['channelId'],
      location: json['location']
    );
  }

  Map<String, dynamic> toJson() =>{
    'channelId':channelId,
    'location':location
  };

}