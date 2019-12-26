import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: MaterialButton(
          child: Text('返回',style: TextStyle(color: Colors.white, fontSize: 24.0),),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}