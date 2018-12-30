import 'package:demo/models/app_state.dart';
import 'package:demo/reducers/product/productReducer.dart';

AppState appReducer(AppState state, action){
  return new AppState(
    userInfo: null,
    loginSession: null,
    merchantList: ProductReducer(state.merchantList,action),
  );
}