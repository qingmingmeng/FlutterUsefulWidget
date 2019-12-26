import 'package:flutter/material.dart';
import 'package:flutter_actual/bottom_navigation2/each_view.dart';

class BottomGuide2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationWidget();
  }
}

class BottomNavigationWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationWidgetState();
  }
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget>{
  List<Widget> _widgets = List();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _widgets..add(EachPage('Home'))..add(EachPage('Email'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pageJump(context, EachPage('New page')),
        tooltip: 'Clicked',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,//floatingActionButton与底部两个导航按钮融合
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.email),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

_pageJump(BuildContext context, Widget toWidget){
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => toWidget
  ));
}