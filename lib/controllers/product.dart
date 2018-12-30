import 'package:redux/redux.dart';

import 'package:demo/controllers/common.dart';
import 'package:demo/models/product/merchant_info.dart';
import 'package:demo/models/product/merchant_request.dart';
import 'package:demo/models/product/merchant_city.dart';
import 'package:demo/models/common/Result.dart';
import 'package:demo/actions/product/action.dart';

queryMerchantList(Store store) {
  List<MerchantInfo> merchantInfoList = [];
  // 请求参数
  MerchantRequestDto merchantRequestDto = new MerchantRequestDto();
  merchantRequestDto.channelId = 2;
  //  merchantRequestDto.location = '31.11325,121.38206';
  // 发起请求并等待结果
  Future<Result> future = commonRequest('/merchant/list',merchantRequestDto.toJson().toString());
  future.then((Result result){
    if(result.isSuccess()){
      print('result.value.runtimeType:${result.value.runtimeType}');
      MerchantAndCityDto merchantAndCityDto = MerchantAndCityDto.fromJson(result.value);

      print('merchantAndCityDto:${merchantAndCityDto.merchantList.runtimeType}');
      merchantInfoList = merchantAndCityDto.merchantList;
      print('得到结果####################');
      store.dispatch(new QueryMerchantListResultAction(merchantInfoList));
    }
  });

//  print('调用到了这边了吗？');
//  merchantInfoList = <MerchantInfo>[
//    MerchantInfo(merchantCode: 'M15272294210000000536', merchantName:'上海南山医院',imageUrl: 'http://cdn.yifen7.cn/yifenqi/wxapp/main/p_list_nanshan5.25.png'),
//    MerchantInfo(merchantCode: 'M15349938410000000578', merchantName:'上海铭悦医美',imageUrl: 'http://cdn.yifen7.cn/yifenqi/wxapp/main/p_list_mingyue.png')
//  ];
//  print('自定义merchantInfoList:${merchantInfoList.runtimeType}');
//  return merchantInfoList;
}