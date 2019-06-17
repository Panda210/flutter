import 'package:demo/actions/actions.dart';

import 'package:demo/models/user/login_session.dart';
import 'package:demo/models/user/user_info.dart';

// 登录成功状态保存
class LoginResultAction extends Action{
  LoginSession loginSession;
  UserInfo userInfo;
  LoginResultAction(this.loginSession,this.userInfo):super(type: Actions.LoginResult);
}


