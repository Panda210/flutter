class BaseDto{
  int channelId;
  String userId;

  BaseDto({this.channelId,this.userId});

  factory BaseDto.fromJson(Map<String, dynamic> json) {
    return BaseDto(
        channelId: json['channelId'],
        userId:json['userId']
    );
  }

  Map<String, dynamic> toJson() =>{
    'channelId':channelId,
    'userId':userId
  };
}