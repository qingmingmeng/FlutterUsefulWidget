import 'package:flutter/material.dart';
import 'package:flutter_actual/bottom_navigation1/airplay.dart';
import 'package:flutter_actual/bottom_navigation1/email.dart';
import 'package:flutter_actual/bottom_navigation1/home.dart';
import 'package:flutter_actual/bottom_navigation1/pages.dart';

class BottomGuide1 extends StatelessWidget{
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
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> widgets = List();

  @override
  void initState() {
    widgets
      ..add(HomePage())
      ..add(EmailPage())
      ..add(Pages())
      ..add(AirplayPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            title: Text('Home',),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email,),
            title: Text('Email',),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages,),
            title: Text('Pages',),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplay,),
            title: Text('Airplay',),
          ),
        ],
        type: BottomNavigationBarType.fixed,//底部数量超过三个，需要定义type
        currentIndex: _currentIndex,
        fixedColor: _bottomNavigationColor,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}