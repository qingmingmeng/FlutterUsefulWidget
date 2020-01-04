import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_actual/bottom_navigation1/bottom_guide1.dart';
import 'package:flutter_actual/bottom_navigation2/bottom_guide2.dart';
import 'package:flutter_actual/data_save_and_read/data_save_and_read.dart';
import 'package:flutter_actual/drag/drag.dart';
import 'package:flutter_actual/frosted_glass/frosted_glass.dart';
import 'package:flutter_actual/jump_animation/animation_list.dart';
import 'package:flutter_actual/progress/progress.dart';
import 'package:flutter_actual/right_back/right_back.dart';
import 'package:flutter_actual/search/search.dart';
import 'package:flutter_actual/wrap/wrap.dart';

import 'bessel/bessel.dart';
import 'expansion/expansion_panel_list.dart';
import 'expansion/expansion_tile.dart';
import 'keep_state/keep_state.dart';

class MainHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 实战'),
        centerTitle: true,
        elevation: 0.0,//阴影效果，0.0标识没有阴影
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('底部导航栏1'),
              onTap: () => _pageJump(context, BottomGuide1()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('底部导航栏2'),
              onTap: () => _pageJump(context, BottomGuide2()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('跳转动画'),
              onTap: () => _pageJump(context, AnimationList()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('磨砂玻璃效果'),
              onTap: () => _pageJump(context, FrostedGlass()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('TabBar + 保持页面状态'),
              onTap: () => _pageJump(context, KeepState()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('搜索框'),
              onTap: () => _pageJump(context, Search()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Wrap流式布局'),
              onTap: () => _pageJump(context, WrapWidget()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('展开闭合(ExpansionTile)'),
              onTap: () => _pageJump(context, ExpansionTileWidget()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('展开闭合(ExpansionPanelList)'),
              onTap: () => _pageJump(context, ExpansionPanelListWidget()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('路径切割(贝塞尔曲线)'),
              onTap: () => _pageJump(context, BesselWidget()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('右滑返回'),
              onTap: () => _pageJumpWithRightBack(context,RightBack()),
            ),
          ),
          Card(
            child: Tooltip(
              message: '这是一个轻量级提示',
              child: ListTile(
                title: Text('长按轻量级提示'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('拖动效果'),
              onTap: () => _pageJumpWithRightBack(context,Drag()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('数据保存与读取'),
              onTap: () => _pageJumpWithRightBack(context,DataSaveAndRead()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('进度条'),
              onTap: () => _pageJumpWithRightBack(context,Progress()),
            ),
          ),
        ],
      ),
    );
  }
}

//普通的页面跳转
_pageJump(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(
      builder: (context) => widget,
  ));
}

//页面跳转，且可以右滑返回，注意，需要从屏幕最左侧滑动才有效果
_pageJumpWithRightBack(BuildContext context, Widget widget){
  Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => widget,
  ));
}