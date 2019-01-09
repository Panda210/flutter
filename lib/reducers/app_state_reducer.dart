import 'package:demo/models/app_state.dart';
import 'package:demo/reducers/product/productReducer.dart';
import 'package:demo/actions/actions.dart';

AppState appReducer(AppState state, dynamic action){
//  return new AppState(
//    userInfo: null,
//    loginSession: null,
//    merchantList: ProductReducer(state.merchantList,action),
//  );

  print("state charge :$action ");

  if(action.type == Actions.QueryMerchantList){
    return AppState(merchantList: ProductReducer(state.merchantList,action));
  }


  print("state charge :$state ");
  return state;
}