class UserInfo{
  // 用户姓名
  String name;
  // 密码
  String password;


  UserInfo({this.name,this.password});

  factory UserInfo.fromJson(Map<String, dynamic> json){
    return UserInfo(
      name: json['name'],
      password: json['password']
    );
  }

  Map<String, dynamic> toJson() =>{
    'name': this.name,
    'password': this.password
  };
}