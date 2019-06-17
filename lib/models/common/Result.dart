class Result<T> {
  bool success;
  String errorCode;
  String errorMsg;
  T value;
  Map extraInfo;

  Result({this.success,this.errorCode,this.errorMsg,this.value,this.extraInfo});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      success: json['success'] ,
      errorCode:json['errorCode'],
      errorMsg:json['errorMsg'],
      value:json['value'],
      extraInfo:json['extraInfo']
    );
  }

  Map<String, dynamic> toJson() =>{
    'success':success,
    'errorCode':errorCode,
    'errorMsg':errorMsg,
    'value':value,
    'extraInfo':extraInfo,
  };

  setErrorMsg(Result result ,String errorMsg){
      result.success = false;
      result.errorMsg = errorMsg;
      return result;
  }

  setErrorInfo(Result result ,String errorCode, String errorMsg){
    result.success = false;
    result.errorCode = errorCode;
    result.errorMsg = errorMsg;
    return result;
  }

  isSuccess(){
    return success;
  }
}