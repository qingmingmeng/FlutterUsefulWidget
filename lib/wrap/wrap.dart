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
            Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578108081&di=d33da2fa93a21f9c44dcebe94695ec79&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F13%2F20151113102712_sGJfF.thumb.700_0.jpeg',
              fit: BoxFit.fill,),
            Text('$_count',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36.0),)
          ],
        ),
      ),
    );
  }
}