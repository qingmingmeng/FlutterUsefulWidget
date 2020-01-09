import 'package:flutter/material.dart';
import 'package:flutter_actual/notification/my_notification.dart';

class NotificationDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NotificationDemoState();
  }
}

class NotificationDemoState extends State<NotificationDemo>{
  String _msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息通知Notification'),
        centerTitle: true,
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg;
          });
          return true;//阻止冒泡，如果父控件也有NotificationListener，则父控件的监听不会生效
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                    child: Text('发布消息：Hi'),
                    onPressed: () => MyNotification('Hi').dispatch(context),
                  );
                },
              ),
              Text('$_msg'),
            ],
          ),
        ),
      ),
    );
  }
}