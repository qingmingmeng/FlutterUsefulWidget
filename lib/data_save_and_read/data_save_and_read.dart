import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataSaveAndRead extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DataSaveAndReadState();
  }
}

class _DataSaveAndReadState extends State<DataSaveAndRead>{
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _nameFromSp = '';
  String _pwdFromSp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据存储与读取'),
        centerTitle: true,
      ),
      body: homeWidget(),
    );
  }

  Widget homeWidget(){
    return Column(
      children: <Widget>[
        Container(
          child: TextField(
            autofocus: true,
            controller: _userNameController,
            decoration: InputDecoration(
              labelText: '用户名',
              hintText: '用户名或手机号',
              prefixIcon: Icon(Icons.person),
              border: InputBorder.none,//隐藏下划线
            ),
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200,width: 1.0)
              )
          ),
        ),
        Container(
          child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: '密码',
              hintText: '登录密码',
              prefixIcon: Icon(Icons.lock),
              border: InputBorder.none,//隐藏下划线
            ),
            obscureText: true,//隐藏密码
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200,width: 1.0)
              )
          ),
        ),
        Text(
          '用户名：$_nameFromSp',
        ),
        Text(
          '密码：$_pwdFromSp',
        ),
        RaisedButton(
          child: Text('保存用户名密码'),
          onPressed: (){
            putString('userName', _userNameController.text);
            putString('password', _passwordController.text);
          },
        ),
        RaisedButton(
          child: Text('显示用户名密码'),
          onPressed: (){
            setState((){
              showString();
            });
          },
        ),
      ],
    );
  }

  void putString(String key, String value) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  void showString() async{
    SharedPreferences preferences  = await SharedPreferences.getInstance();
    _nameFromSp = preferences.getString('userName');
    _pwdFromSp = preferences.getString('password');
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }
}