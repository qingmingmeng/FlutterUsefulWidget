import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget widget;
  final String animationType;

  CustomRoute(this.widget, this.animationType)
      : super(
    transitionDuration: Duration(seconds: 1),
    pageBuilder: (BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,) {
      return widget;
    },
    transitionsBuilder:(
    BuildContext context,
    Animation < double > animation1,
    Animation < double > animation2,
    Widget child,){
      if ('FadeTransition' == animationType){
        return FadeTransition(//渐变
          opacity: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn
          )),
          child: child,
        );
      } else if('ScaleTransition' == animationType){
        return ScaleTransition(//缩放
          scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )),
          child: child,
        );
      } else if('Rotation_ScaleTransition' == animationType){
        return RotationTransition(//旋转
          turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )),
          child: ScaleTransition(//缩放
            scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn
            )),
            child: child,
          ),
        );
      } else if('SlideTransition' == animationType){
        return SlideTransition(//平移
          position: Tween<Offset>(
            begin: Offset(1.0,0.0),
            end: Offset(0.0,0.0)
          ).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )),
          child: child,
        );
      } else {
        return SlideTransition(//默认平移
          position: Tween<Offset>(
              begin: Offset(-1.0,0.0),
              end: Offset(0.0,0.0)
          ).animate(CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn
          )),
          child: child,
        );
      }
    }
  );
}