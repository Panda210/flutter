import 'package:redux/redux.dart';
import 'package:demo/models/product/merchant_info.dart';
import 'package:demo/actions/product/action.dart';

final ProductReducer = combineReducers<List<MerchantInfo>>([
  TypedReducer<List<MerchantInfo>, QueryMerchantListResultAction>(queryMerchantListResult)
]);


List<MerchantInfo> queryMerchantListResult(List<MerchantInfo> merchantList, QueryMerchantListResultAction action){
  return action.merchantList;
}

