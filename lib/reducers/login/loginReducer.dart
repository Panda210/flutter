import 'package:redux/redux.dart';
import 'package:demo/models/user/login_session.dart';
import 'package:demo/models/user/user_info.dart';
import 'package:demo/actions/login/action.dart';
import 'package:demo/actions/actions.dart';

final LoginReducer = combineReducers<LoginSession>([
  TypedReducer<LoginSession, LoginResultAction>(loginResult),
]);

LoginSession loginResult(LoginSession loginSession, LoginResultAction action){
  return action.loginSession;
}
