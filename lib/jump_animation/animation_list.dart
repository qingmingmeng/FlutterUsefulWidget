import 'package:flutter/material.dart';
import 'package:flutter_actual/jump_animation/custom_router.dart';
import 'package:flutter_actual/jump_animation/second_page.dart';

class AnimationList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('跳转样式列表'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('渐变跳转'),
              onTap: () {
                _pageJump(context, 'FadeTransition');
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('缩放跳转'),
              onTap: () {
                _pageJump(context, 'ScaleTransition');
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('旋转+缩放跳转'),
              onTap: () {
                _pageJump(context, 'Rotation_ScaleTransition');
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('平移'),
              onTap: () {
                _pageJump(context, 'SlideTransition');
              },
            ),
          ),
        ],
      ),
    );
  }
}

_pageJump(BuildContext context, String type){
  Navigator.push(context, CustomRoute(SecondPage(),type));
}