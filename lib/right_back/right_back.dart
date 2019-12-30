import 'package:flutter/material.dart';

class RightBack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('右滑返回'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('右滑返回上一页',style: TextStyle(color: Colors.greenAccent,fontSize: 28.0),),
      ),
    );
  }
}