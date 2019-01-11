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
    return null;
  }

  // 检查再次确认填写的密码与原有密码是否一致
  static String checkDoublePassword(String doublePassword,String password){
    if(password.isEmpty){
      return '请先输入密码';
    }
    if(doublePassword.isEmpty){
      return '请确认密码';
    }

    if(doublePassword != password){
      return '两次输入密码不相同，请重新输入';
    }

    return null;
  }

  // 手机号码的验证:1开头，
  static String checkPhoneNumber(String phoneNumber){
    if(phoneNumber.isEmpty){
      return '请输入手机号码';
    }
    RegExp phoneNumberExp = new RegExp("1[3456789][0-9]{9}");
    if(!phoneNumberExp.hasMatch(phoneNumber)){
      return '手机号码不合法';
    }
    if(phoneNumber.length != 11){
      return '手机号码长度不合法';
    }
    return null;
  }

  // 验证码
  static String checkValidateNumber(String number){
    if(number.isEmpty){
      return '请输入验证码';
    }
    if(number.length != 6){
      return '验证码不合法';
    }
    return null;
  }

  // 检查是否为空
  static String checkNullResult(String value,String errorMsg){
    if(value.isEmpty){
      return errorMsg;
    }
    return null;
  }

}