import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('展开闭合(ExpansionTile)'),
        centerTitle: true,
      ),
      body: Center(
        child: ExpansionTile(
          title: Text('闭合时展示的内容'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,//打开之后的背景颜色
          children: <Widget>[
            ListTile(
              title: Text('这是展开的title'),
              subtitle: Text('这是展开的subTitle'),
            ),
          ],
          initiallyExpanded: false,//默认打开还是闭合， true：默认打开
        ),
      ),
    );
  }
}