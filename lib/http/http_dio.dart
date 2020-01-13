import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpDioDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HttpDioDemoState();
  }
}

class _HttpDioDemoState extends State<HttpDioDemo>{
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络请求(Dio库)'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: _dio.get('https://api.github.com/orgs/flutterchina/repos'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              Response response = snapshot.data;
              if(snapshot.hasError){//请求错误
                return Text(snapshot.error.toString());
              }
              return ListView(//请求成功
                children: response.data.map<Widget>((e) =>
                    ListTile(title: Text(e["full_name"]))
                ).toList(),
              );
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}