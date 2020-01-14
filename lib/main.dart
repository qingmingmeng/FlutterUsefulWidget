import 'package:flutter/material.dart';
import 'package:flutter_actual/home_page.dart';

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
//  AnimationController _controller;
//  Animation _animation;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MainHome()
      ));
    });
//    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
//    _animation = Tween(begin: 1.0, end: 1.0).animate(_controller);
//
//    _animation.addStatusListener((states){
//      if(states == AnimationStatus.completed){//动画结束
//        Navigator.of(context).pushAndRemoveUntil(
//            MaterialPageRoute(builder: (context) => MainHome()),
//                (route) => route == null);
//      }
//    });
//
//    _controller.forward();//播放动画
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/splash.jpg',
      fit: BoxFit.cover,
    );
//    return FadeTransition(
//      opacity: _animation,
//      child: Image.asset(
//        'images/splash.jpg',
//        fit: BoxFit.cover,
//      ),
//    );
  }

  @override
  void dispose() {
    super.dispose();
//    _controller.dispose();
  }
}