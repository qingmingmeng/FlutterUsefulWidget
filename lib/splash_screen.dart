import 'package:flutter/material.dart';
import 'package:flutter_actual/main.dart';

void main() => runApp(Splash());

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 实战',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    
    _animation.addStatusListener((states){
      if(states == AnimationStatus.completed){//动画结束
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainHome()),
            (route) => route == null);
      }
    });

    _controller.forward();//播放动画
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578108081&di=d33da2fa93a21f9c44dcebe94695ec79&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F13%2F20151113102712_sGJfF.thumb.700_0.jpeg',
        //scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}