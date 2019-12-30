import 'package:flutter/material.dart';

class DragWidget extends StatefulWidget{
  final Offset offset;
  final Color widgetColor;
  DragWidget({Key key, this.offset, this.widgetColor}) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    return _DragWidgetState();
  }
}

class _DragWidgetState extends State<DragWidget>{
  Offset offset = Offset(0.0,0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.widgetColor,
        ),
        feedback: Container(//拖拽时的效果
          width: 110.0,
          height: 110.0,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset){//松手时的处理，这里的offset是松手时的位置
          /*setState(() {
            this.offset = offset;
          });*/
        },
      ),
    );
  }
}