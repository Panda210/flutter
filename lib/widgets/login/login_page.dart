import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/services.dart';

import 'package:demo/models/app_state.dart';
import 'package:demo/models/user/login_session.dart';
import 'package:demo/models/user/user_info.dart';

import 'package:demo/actions/login/action.dart';

import 'package:demo/utils/CommonUtil.dart';
import 'package:demo/utils/ShareDataUtil.dart';

import 'package:demo/widgets/components/common_dialog.dart';
import 'package:demo/widgets/login/register_page.dart';

class LoginPage extends StatefulWidget{

  static final String routerName = "/login";

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _passwordController =  new TextEditingController();
  TextEditingController _validateNumberController = new TextEditingController();

  String buttonLabel = '登录';

  Store<AppState> getStore(){
    return StoreProvider.of(context);
  }

  void prepareRegister() {
    var _form = _formKey.currentState;
    print('开始注册');
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  void login() {
    var _form = _formKey.currentState;
    print('开始登录');
    print('${_form.context.toString()}');
    print('输入的name:${_phoneNumberController.text}');
    print('输入的password:${_passwordController.text}');
    print('家宴的结果：${_form.validate()}');
    if(_form.validate()){
      // loginSession信息保存
      LoginSession loginSession = new LoginSession();
      loginSession.isLogin = true;
      loginSession.userName = 'Joyce';
      loginSession.userId = '12345678';
      loginSession.phoneNumber = _phoneNumberController.text;
      loginSession.sessionKey = '';
      loginSession.channelId = 1;
      ShareDataUtil.saveLoginInfo(loginSession);
      print('登录成功 loginSession:${loginSession.toJson()}');
      UserInfo userInfo = new UserInfo();
      userInfo.name = loginSession.userName;
      print('登录成功 userInfo:${userInfo.toJson()}');
      getStore().dispatch(LoginResultAction(loginSession, userInfo));
    }else{
      showErrorDialog(context,'信息未完善');
    }
  }

  genValidateNumber(){
    print('点击获取验证码');
  }

  // 登录页面静态展示
  Widget loginWidget(){
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            '登录',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 32.0,
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
                        flex: 2,
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
                        flex: 1,
                      )
                    ],
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
//                  labelText: '请输入密码',
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
                      login();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: RaisedButton(
            child: Text(
              "如无账号，请先注册",
              style: new TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic
              ),
            ),
            color: Colors.white10,
            disabledColor: Colors.grey,
            textColor: Colors.white,
            elevation:0,
            onPressed: () {
              prepareRegister();
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('login page build');
    return StoreConnector<AppState,LoginSession>(
      converter: (store) => store.state.loginSession,
      builder: (context,loginSession){
        return Scaffold(
          appBar: AppBar(
            title: Text('登录页面')
          ),
          //        floatingActionButton: FloatingActionButton(
          //            child: Text('登录'),
          //            onPressed: null),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: loginWidget(),
          )
        );
      }
    );

  }

  @override
  void initState() {
    print('login page initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('login page didChangeDependencies');
    super.didChangeDependencies();
  }


  @override
  void reassemble() {
    print('login page reassemble');
    super.reassemble();
  }

  @override
  void didUpdateWidget(LoginPage oldWidget) {
    print('login page didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('login page deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('login page dispose');
    super.dispose();
  }

}
