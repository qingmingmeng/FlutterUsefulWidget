import 'package:flutter/material.dart';
import 'package:flutter_actual/bottom_navigation1/airplay.dart';
import 'package:flutter_actual/bottom_navigation1/email.dart';
import 'package:flutter_actual/bottom_navigation1/home.dart';
import 'package:flutter_actual/bottom_navigation1/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '练习底部导航栏',
      home: _BottomGuideWidget(),
    );
  }
}

class _BottomGuideWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BottomGuideWidgetState();
  }
}

class _BottomGuideWidgetState extends State<_BottomGuideWidget>{
  final _bottomColor = Colors.blue;
  List<Widget> widgets = List();
  int _currentIndex = 0;

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
            icon: Icon(
              Icons.home,
              color: _bottomColor,
            ),
            title: Text('Home',style: TextStyle(color: _bottomColor),),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _bottomColor,
            ),
            title: Text('Email',style: TextStyle(color: _bottomColor),),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _bottomColor,
            ),
            title: Text('Pages',style: TextStyle(color: _bottomColor),),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _bottomColor,
            ),
            title: Text('Airplay',style: TextStyle(color: _bottomColor),),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}