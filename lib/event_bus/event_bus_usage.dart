import 'package:flutter/material.dart';
import 'package:flutter_actual/event_bus/event_bus_factory.dart';

class EventBusUsage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _EventBusUsageState();
  }
}

class _EventBusUsageState extends State<EventBusUsage>{
  String _receive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventBus'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('$_receive'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: RaisedButton(
              child: Text('注册登录事件'),
              onPressed: (){
                bus.add('login', (arg){
                  setState(() {
                    _receive = arg;
                  });
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: RaisedButton(
              child: Text('解绑登录事件'),
              onPressed: (){
                bus.remove('login');
                setState(() {
                  _receive = '';
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: RaisedButton(
              child: Text('发布登录事件'),
              onPressed: () => bus.push('login','登录成功了，刷新页面吧'),
            ),
          ),
        ],
      ),
    );
  }
}