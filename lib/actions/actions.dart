// 定义Action的Type枚举类
enum Actions{
  QueryMerchantList
}



// 定义所有Action的基类
class Action{
  final Actions type;

  Action({this.type});
}

