import 'package:demo/actions/actions.dart';

import 'package:demo/models/product/merchant_info.dart';


// 查询商户的action
class QueryMerchantListResultAction extends Action{
  final List<MerchantInfo> merchantList;

  QueryMerchantListResultAction(this.merchantList):super(type: Actions.QueryMerchantList);
}