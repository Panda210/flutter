import 'package:demo/models/common/Result.dart';

class TransformValue {

  // 拷贝信息从source 到 target
  static Result copyErrorInfo(Result source, Result target){
    target.success = false;
    target.errorCode = source.errorCode;
    target.errorMsg = source.errorMsg;
    return target;
  }

  // 设置错误信息 到 target
  static Result setErrorInfo(Result target, String errorCode, String errorMsg, var value){
    target.success = false;
    target.errorCode = errorCode;
    target.errorMsg = errorMsg;
    target.value = value;
    return target;
  }

}