import 'package:demo/models/product/merchant_info.dart';

// 查询商户的action
class QueryMerchantListAction {
  QueryMerchantListAction();
}

class QueryMerchantListResultAction{
  final List<MerchantInfo> merchantList;
  QueryMerchantListResultAction(this.merchantList);
}