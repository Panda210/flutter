import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:demo/utils/CommonUtil.dart';
import 'package:demo/utils/ShareDataUtil.dart';

import 'package:demo/models/app_state.dart';
import 'package:demo/models/user/login_session.dart';
import 'package:demo/models/user/user_info.dart';

import 'package:demo/actions/login/action.dart';

import 'package:demo/widgets/components/common_dialog.dart';

import 'package:demo/widgets/myInfo/my_info.dart';

class RegisterPage extends StatefulWidget{

  static final String routerName = "/register";

  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }

}

class RegisterPageState extends State<RegisterPage>{

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _passwordController =  new TextEditingController();
  TextEditingController _validateNumberController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

  String buttonLabel = '注册';

  Store<AppState> getStore(){
    return StoreProvider.of(context);
  }

  register() {
    var _form = _formKey.currentState;
    print('开始注册  --- 默认成功跳转到我的信息页面');
    print('输入的name:${_phoneNumberController.text}');
    print('输入的password:${_passwordController.text}');
    if(_form.validate()){
      print('注册完成自动进入个人中心');
      // 假数据
      LoginSession loginSession = new LoginSession();
      loginSession.isLogin = true;
      loginSession.userName = 'Joyce';
      loginSession.phoneNumber = _phoneNumberController.text;
      loginSession.userId = '12345678';
      loginSession.sessionKey = '';
      loginSession.channelId = 1;
      ShareDataUtil.saveLoginInfo(loginSession);
      print('登录成功 loginSession:${loginSession.toJson()}');
      UserInfo userInfo = new UserInfo();
      userInfo.name = loginSession.userName;
      print('登录成功 userInfo:${userInfo.toJson()}');
      getStore().dispatch(LoginResultAction(loginSession, userInfo));
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoPage()));
    }else{
      showErrorDialog(context, '信息未完善');
    }

  }

  genValidateNumber(){
    print('点击获取验证码');
  }

  @override
  Widget build(BuildContext context) {
    print('register page build');
    return Scaffold(
      appBar: AppBar(
          title: Text('注册页面')
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '注册',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(80),
                  color: Color(0xffc4c4c4)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Form(
              key: _formKey,
              child: Column(
                children:<Widget>[
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
//                  labelText: '请输入手机号码',
                        hintText: '请输入手机号码',
                        icon: Icon(Icons.phone)
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    autovalidate: true,
                    validator: (phoneNumber){
                      return CommonUtil.checkPhoneNumber(phoneNumber);
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: '请输入密码',
                        icon: new Icon(Icons.lock)
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    autovalidate: true,
                    validator: (password){
                      return CommonUtil.checkPasswordResult(password);
                    },
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                        hintText: '请确认密码',
                        icon: new Icon(Icons.lock)
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    autovalidate: true,
                    validator: (password){
                      return CommonUtil.checkDoublePassword(password,_passwordController.text);
                    },
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: _validateNumberController,
                            decoration: InputDecoration(
                                hintText: '请输入验证码',
                                icon: new Icon(
                                    new IconData(0xe666, fontFamily: 'wxcIconFont')
                                )
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            autovalidate: true,
                            validator: (number){
                              return CommonUtil.checkValidateNumber(number);
                            },
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            margin: EdgeInsets.all(10),
                            child: RaisedButton(
                              child: Text(
                                '获取验证码',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              disabledColor: Colors.grey,
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: (){
                                genValidateNumber();
                              },
                            ),
                          ),
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    child: RaisedButton(
                      child: new Text(
                        buttonLabel,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue,
                      disabledColor: Colors.grey,
                      textColor: Colors.white,
                      onPressed: (){
                        register();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
      )
    );
  }


  @override
  void initState() {
    print('register page initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('register page didChangeDependencies');
    super.didChangeDependencies();
  }


  @override
  void reassemble() {
    print('register page reassemble');
    super.reassemble();
  }

  @override
  void didUpdateWidget(RegisterPage oldWidget) {
    print('register page didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('register page deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('register page dispose');
    super.dispose();
  }

}