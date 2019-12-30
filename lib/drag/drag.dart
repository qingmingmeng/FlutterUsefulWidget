import 'package:flutter/material.dart';
import 'package:flutter_actual/drag/drag_widget.dart';

class Drag extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DragState();
  }
}

class _DragState extends State<Drag>{
  Color _draggableColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖拽效果'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          DragWidget(
            offset: Offset(80.0,80.0),
            widgetColor: Colors.tealAccent,
          ),
          DragWidget(
            offset: Offset(180.0,80.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(
              onAccept: (Color color){//触发事件
                _draggableColor = color;
              },
              builder: (context, candidateData, rejectedData){
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: _draggableColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}