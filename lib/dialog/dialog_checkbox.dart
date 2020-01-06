import 'package:flutter/material.dart';

/// 单独抽离一个StatefulWidget专门控制弹窗中的checkBox的选中状态
/// 本方法比较麻烦，只是为了阐述一种方式
class DialogCheckBox extends StatefulWidget{
  final ValueChanged<bool> onChanged;
  final bool value;

  DialogCheckBox({
    Key key,
    this.value,
    @required this.onChanged
  });

  @override
  State<StatefulWidget> createState() {
    return _DialogCheckBoxState();
  }
}

class _DialogCheckBoxState extends State<DialogCheckBox>{
  bool value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v){
        widget.onChanged(v);
        setState(() {
          value = v;
        });
      },
    );
  }
}