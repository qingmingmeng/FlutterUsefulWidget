import 'package:flutter/material.dart';
import 'package:flutter_actual/search/search_bar_delegate.dart';

class Search extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              //print('点击了搜索图标');
              showSearch(context: context, delegate: SeachBarDelegate());
            },
          ),
        ],
      ),
    );
  }
}