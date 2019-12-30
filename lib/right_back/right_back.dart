import 'package:flutter/material.dart';

class RightBack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('右滑返回上一页',style: TextStyle(color: Colors.greenAccent,fontSize: 28.0),),
      ),
    );
  }
}