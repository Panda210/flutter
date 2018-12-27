import 'package:demo/biz/common/controller/CommonController.dart';
import 'package:demo/biz/product/dto/MerchantInfo.dart';
import 'package:demo/biz/product/dto/MerchantRequestDto.dart';
import 'package:demo/biz/product/dto/MerchantAndCityDto.dart';
import 'package:demo/biz/common/dto/Result.dart';
import 'dart:convert';

List<MerchantInfo> queryMerchantList() {
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

      print('merchantAndCityDto:${merchantAndCityDto.merchantInfoList.runtimeType}');
      merchantInfoList = merchantAndCityDto.merchantInfoList;
      print('得到结果了？');
      return merchantInfoList;
    }
  });

  print('调用到了这边了吗？');
//  merchantInfoList = <MerchantInfo>[
//    MerchantInfo(merchantCode: 'M15272294210000000536', merchantName:'上海南山医院',imageUrl: 'http://cdn.yifen7.cn/yifenqi/wxapp/main/p_list_nanshan5.25.png'),
//    MerchantInfo(merchantCode: 'M15349938410000000578', merchantName:'上海铭悦医美',imageUrl: 'http://cdn.yifen7.cn/yifenqi/wxapp/main/p_list_mingyue.png')
//  ];
//  print('自定义merchantInfoList:${merchantInfoList.runtimeType}');
//  return merchantInfoList;
}