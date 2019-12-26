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
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,
            ),
            title: Text('Home', style: TextStyle(color: _bottomNavigationColor),),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _bottomNavigationColor,
            ),
            title: Text('Email', style: TextStyle(color: _bottomNavigationColor),),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _bottomNavigationColor,
            ),
            title: Text('Pages', style: TextStyle(color: _bottomNavigationColor),),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _bottomNavigationColor,
            ),
            title: Text('Airplay', style: TextStyle(color: _bottomNavigationColor),),
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