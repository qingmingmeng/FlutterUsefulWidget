import 'package:flutter/material.dart';

class KeepState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _KeepState();
  }
}

class _KeepState extends State<KeepState> with SingleTickerProviderStateMixin {

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保持页面状态'),
        centerTitle: true,
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_car),),
            Tab(icon: Icon(Icons.directions_transit),),
            Tab(icon: Icon(Icons.directions_bike),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          KeepPage(),
          KeepPage(),
          KeepPage(),
        ],
      ),
    );
  }
}

class KeepPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _KeepPage();
  }
}

class _KeepPage extends State<KeepPage> with AutomaticKeepAliveClientMixin{
  int _counter = 0;

  @override
  bool get wantKeepAlive => true;

  void _incrementCounter(){
    setState(() {
      _counter ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点击一次增加一个数字'),
            Text('$_counter',style: Theme.of(context).textTheme.display1,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}