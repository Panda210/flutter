import 'package:demo/models/app_state.dart';

import 'package:demo/actions/actions.dart';

import 'package:demo/reducers/product/productReducer.dart';
import 'package:demo/reducers/login/loginReducer.dart';

AppState appReducer(AppState state, dynamic action){
  print("state charge :$action ");

//  if(action is Action && action.type == Actions.QueryMerchantList){
//    return AppState(merchantList: ProductReducer(state.merchantList,action));
//  }
//
//  if(action is Action && action.type == Actions.LoginResult){
//    return AppState(loginSession: LoginReducer(state.loginSession,action));
//  }
//
//
//  print("state charge :$state ");
//  return state;
//
  return AppState(
    loginSession: LoginReducer(state.loginSession,action),
    merchantList: ProductReducer(state.merchantList,action)
  );
}