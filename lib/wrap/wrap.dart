import 'package:flutter/material.dart';

class WrapWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WrapWidgetState();
  }
}

class _WrapWidgetState extends State<WrapWidget>{
  List<Widget> _widgets = List();
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _widgets..add(buildButton())..add(deleteButton());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap 流式布局'),
        centerTitle: true,
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height/2,
            color: Colors.grey,
            child: Wrap(
              children: _widgets,
              spacing: 26.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(){
    return GestureDetector(
      onTap: (){
        if(_widgets.length < 9){
          _count++;
          setState(() {
            _widgets.insert(_widgets.length - 2, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.white,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget deleteButton(){
    return GestureDetector(
      onTap: (){
        if(_widgets.length > 2){
          _count++;
          setState(() {
            _widgets.removeAt(0);
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.white,
          child: Icon(Icons.remove),
        ),
      ),
    );
  }

  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.white30,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.network('http://img5.mtime.cn/mg/2019/12/17/105244.25525559_170X256X4.jpg',fit: BoxFit.fill,),
            Text('$_count',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36.0),)
          ],
        ),
      ),
    );
  }
}