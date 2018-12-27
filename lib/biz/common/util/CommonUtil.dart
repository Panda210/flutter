class CommonUtil{

  // 密码必须是大小写字母+数字+长度不小于8位
  static bool checkPassword(String password){
    int matchCount = 0;
    if(password == null){
      return false;
    }
    RegExp upperAlphaExp = new RegExp("[A-Z]");
    if(upperAlphaExp.hasMatch(password)){
      ++matchCount;
    }
    RegExp lowerAlphaExp = new RegExp("[a-z]");
    if(lowerAlphaExp.hasMatch(password)){
      ++matchCount;
    }
    RegExp numberExp = new RegExp("[0-9]");
    if(numberExp.hasMatch(password)){
      ++matchCount;
    }
    if(password.length < 8 || matchCount < 3){
      return false;
    }
    return true;
  }

  // 密码的验证，返回错误结果
  static String checkPasswordResult(String password){
    int matchCount = 0;
    if(password.isEmpty){
      return '请输入密码';
    }
    RegExp upperAlphaExp = new RegExp("[A-Z]");
    if(upperAlphaExp.hasMatch(password)){
      ++matchCount;
    }
    RegExp lowerAlphaExp = new RegExp("[a-z]");
    if(lowerAlphaExp.hasMatch(password)){
      ++matchCount;
    }
    RegExp numberExp = new RegExp("[0-9]");
    if(numberExp.hasMatch(password)){
      ++matchCount;
    }
    if(password.length < 8 || matchCount < 3){
      return '密码不合法：必须包含大小写字母和数字且长度大于8';
    }
    return '';
  }

  // 检查是否为空
  static String checkNullResult(String value,String errorMsg){
    if(value.isEmpty){
      return errorMsg;
    }
  }

}