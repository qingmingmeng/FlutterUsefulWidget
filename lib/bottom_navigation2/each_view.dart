import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EachPage extends StatefulWidget{
  String _title;
  EachPage(this._title);

  @override
  State<StatefulWidget> createState() {
    return _EachPageState();
  }
}

class _EachPageState extends State<EachPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        centerTitle: true,
      ),
      body: Center(
        child: Text(widget._title),
      ),
    );
  }
}