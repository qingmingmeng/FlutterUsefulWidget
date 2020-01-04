
import 'dart:async';

import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProgressState();
  }
}

class ProgressState extends State<Progress>{
  Timer _timer;
  double _value = 0;

  @override
  void initState() {
    super.initState();
    _startCountdownTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('进度指示器'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: SizedBox(//指定高度
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: SizedBox(//指定高度
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: _value,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                strokeWidth: 4,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                strokeWidth: 4,
                value: _value,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //倒计时方法
  void _startCountdownTimer() {
    const oneSec = const Duration(milliseconds: 10);
    var callback = (timer) => {
      setState(() {
        if(_value < 1){
          _value += 0.001;
        } else {
          _timer.cancel();
        }
      })
    };
    _timer = Timer.periodic(oneSec, callback);
  }

  @override
  void dispose() {
    super.dispose();
    if(null != _timer){
      _timer.cancel();
    }
  }
}
