import 'package:flutter/material.dart';

class BesselWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路径切割(贝塞尔曲线)'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ClipPath(//路径裁切控件
            clipper: BottomClipper(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}

//一次贝塞尔曲线
/*
class BottomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width/2,size.height);
    var firstEndPiont = Offset(size.width,size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPiont.dx, firstEndPiont.dy);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}*/

//二次贝塞尔曲线
class BottomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width/4,size.height);
    var firstEndPiont = Offset(size.width/2.25,size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPiont.dx, firstEndPiont.dy);
    var secondControlPoint = Offset(size.width*0.75,size.height-90);
    var secondEndPoint = Offset(size.width,size.height-50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
