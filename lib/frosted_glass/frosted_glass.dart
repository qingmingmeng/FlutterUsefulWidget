import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('磨砂玻璃效果'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(//约束盒子，添加额外的约束条件在child上
            constraints: const BoxConstraints.expand(),
            child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578108081&di=d33da2fa93a21f9c44dcebe94695ec79&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F13%2F20151113102712_sGJfF.thumb.700_0.jpeg'),
          ),
          Center(
            child: ClipRect(//可裁切的矩形
              child: BackdropFilter(//背景过滤器
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(//透明度
                  opacity: 0.3,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Text('磨砂效果',style: Theme.of(context).textTheme.display3,),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}