import 'package:flutter/material.dart';

class ExpansionPanelListWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ExpansionPanelListState();
  }
}

class _ExpansionPanelListState extends State<ExpansionPanelListWidget>{
  List<int> _intList;
  List<ExpandStateBean> _beanList;

  @override
  void initState() {
    super.initState();
    _intList = List();
    _beanList = List();
    for(int i = 0 ; i < 15 ; i++){
      _intList.add(i);
      _beanList.add(ExpandStateBean(false, i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('展开闭合(ExpansionPanelList)'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(//必须放在可滚动的控件下
          expansionCallback: (index,isExpand){//点击展开闭合回调
            _setCurrentIndex(index, isExpand);
          },
          children: _intList.map((index){
            return ExpansionPanel(
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title: Text('This is No.$index'),
                );
              },
              body: ListTile(
                title: Text('Expansion No.$index'),
              ),
              isExpanded: _beanList[index].isOpen,
            );
          }).toList(),
        ),
      ),
    );
  }

  _setCurrentIndex(int index, bool isExpand){
    setState(() {
      _beanList.forEach((item){
        if(item.index == index){
          item.isOpen = !isExpand;
        }
      });
    });
  }
}

class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.isOpen,this.index);
}