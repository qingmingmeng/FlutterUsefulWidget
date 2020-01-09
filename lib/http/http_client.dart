import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpCallDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HttpCallDemoState();
  }
}

class _HttpCallDemoState extends State<HttpCallDemo>{
  String _body = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpClient'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('请求百度'),
                  onPressed: () {
                    setState(() {
                      _body = '请求中......';
                    });
                    _httpClientCall();
                  },
                ),
              ],
            ),
            Text('$_body'),
          ],
        ),
      ),
    );
  }

  void _httpClientCall() async {
    try{
      //创建一个httpClient
      HttpClient httpClient = HttpClient();
      //打开http链接
      HttpClientRequest request = await httpClient.getUrl(Uri.parse('https://www.baidu.com'));
      //使用iPhone的UA
      request.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
      //等待连接服务器（会将请求信息发送给服务器）
      HttpClientResponse response = await request.close();
      //读取响应内容
      _showResult(await response.transform(utf8.decoder).join());
      //打印响应头
      print(response.headers);
      ////关闭client后，通过该client发起的所有请求都会中止。
      httpClient.close();
    } catch (e){
      _showResult('请求失败：$e');
    }
  }

  void _showResult(String result){
    setState(() {
      _body = result;
    });
  }
}