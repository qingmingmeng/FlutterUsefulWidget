import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_actual/dialog/customer_dialog.dart';
import 'package:flutter_actual/dialog/dialog_checkbox.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DialogWidgetState();
  }
}

class _DialogWidgetState extends State<DialogWidget> {
  DateTime choosedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog样式'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('普通对话框'),
              onPressed: () async {
                bool sure = await showNormalDialog(context);
                Fluttertoast.showToast(
                    msg: sure ? '点击了确定' : '点击了取消',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM);
              },
            ),
            RaisedButton(
              child: Text('选择对话框'),
              onPressed: () async {
                int position = await showChooseDialog(context);
                if (null != position) {
                  Fluttertoast.showToast(
                      msg: position == 0 ? '中文简体' : '美国英语',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM);
                }
              },
            ),
            RaisedButton(
              child: Text('列表选择对话框'),
              onPressed: () async {
                int position = await showListDialog(context);
                if (null != position) {
                  Fluttertoast.showToast(
                      msg: '$position',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM);
                }
              },
            ),
            RaisedButton(
              child: Text('自定义dialog弹出方式和遮罩'),
              onPressed: () async {
                bool sure = await showMyDialog(context);
                Fluttertoast.showToast(
                    msg: sure ? '确定' : '取消',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM);
              },
            ),
            RaisedButton(
              child: Text('带有复选框的dialog'),
              onPressed: () async {
                int type = await showCheckBoxDialog(context);
                if (type == null) return;
                String msg;
                if (type == 0) {
                  msg = '取消';
                } else if (type == 1) {
                  msg = '删除（同时删除子目录）';
                } else {
                  msg = '删除（不删除子目录）';
                }
                Fluttertoast.showToast(
                    msg: msg,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM);
              },
            ),
            RaisedButton(
              child: Text('底部列表弹窗'),
              onPressed: () async {
                int position = await showBottomDialog(context);
                Fluttertoast.showToast(
                    msg: '$position',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM);
              },
            ),
            RaisedButton(
              child: Text('Loading弹窗'),
              onPressed: () => showLoadingDialog(context),
            ),
            RaisedButton(
              child: Text('Loading弹窗（自定义尺寸）'),
              onPressed: () => showMyLoadingDialog(context),
            ),
            RaisedButton(
              child: Text('日历选择器'),
              onPressed: () async {
                DateTime dateTime = await _showDatePicker(context);
                String date = formatDate(dateTime, [yyyy, "-", mm, "-", dd,]);
                Fluttertoast.showToast(
                    msg: '$date',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM);
              },
            ),
            RaisedButton(
              child: Text('ios风格日历选择器'),
              onPressed: () async {
                DateTime dateTime = await _showDatePickerIOS(context);
                String date = formatDate(choosedTime, [yyyy, "-", mm, "-", dd,]);
                Fluttertoast.showToast(
                    msg: '$date',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM);
              },
            ),
          ],
        ),
      ),
    );
  }

  //展示普通弹窗
  //点击返回关闭弹窗时，不会有返回值
  //不可放ListView、Grideview等延迟加载的控件
  Future<bool> showNormalDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: SingleChildScrollView(
            child: Text('确定要删除选中的文件吗？'),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
              child: Text('确定'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
  }

  //选择对话框
  //点击返回关闭弹窗时，会返回null
  //不可放ListView、Grideview等延迟加载的控件
  Future<int> showChooseDialog(BuildContext context) {
    return showDialog<int>(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('中文简体'),
                onPressed: () => Navigator.of(context).pop(0),
              ),
              SimpleDialogOption(
                child: Text('美国英语'),
                onPressed: () => Navigator.of(context).pop(1),
              ),
            ],
          );
        });
  }

  //列表选择对话框
  //点击返回关闭弹窗时，不会有返回值
  //可以放ListView、Grideview等延迟加载的控件
  Future<int> showListDialog(BuildContext context) {
    return showDialog<int>(
        context: context,
        builder: (context) {
          var dialogChild = Column(
            children: <Widget>[
              ListTile(
                title: Text('请选择'),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('$index'),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey[200],
                      height: 3,
                    );
                  },
                ),
              ),
            ],
          );
          return Dialog(
            child: dialogChild,
          );
        });
  }

  //自定义弹窗动画和遮罩
  Future<bool> showMyDialog(BuildContext context) {
    return showCustomerDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('是否要关闭当前页面？'),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              FlatButton(
                child: Text('确定'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          );
        });
  }

  //带有复选框的dialog（0：取消，1：删除，同时删除子目录，2：删除，不包含子目录）
  Future<int> showCheckBoxDialog(BuildContext context) {
    bool isChoosed = false;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, //默认为max，会最大限度撑开布局
              children: <Widget>[
                Text('删除当前文件夹'),
                Row(
                  children: <Widget>[
                    Text('同时删除子目录'),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Builder(
                        // 通过Builder来获得构建Checkbox的`context`，
                        // 这是一种常用的缩小`context`范围的方式
                        //否则checkBox状态改变时会引起整个页面的重绘，造成资源浪费
                        builder: (context) {
                          return Checkbox(
                            value: isChoosed,
                            onChanged: (v) {
                              //setState()方法实际上是调用markNeedsBuild()方法
                              //将当前的Element对象标记为“dirty”，在每一个Frame
                              //Flutter都会重新构建被标记为“dirty”Element对象
                              //通过context获取到Element对象，从而达到更新UI的目的
                              (context as Element).markNeedsBuild();
                              isChoosed = !isChoosed;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(0),
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () => Navigator.of(context).pop(isChoosed ? 1 : 2),
              ),
            ],
          );
        });
  }

  //展示底部列表弹窗
  Future<int> showBottomDialog(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index){
            return ListTile(
              title: Text('$index'),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey[200],
              height: 3,
            );
          },
        );
      }
    );
  }

  //loading
  void showLoadingDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,//点击遮罩不关闭对话框
      builder: (context){
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('加载中，请稍候...'),
              )
            ],
          ),
        );
      }
    );
  }

  //loading，自定义尺寸
  void showMyLoadingDialog(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,//点击遮罩不关闭对话框
        builder: (context){
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('加载中，请稍候...'),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  //日历选择器
  Future<DateTime> _showDatePicker(BuildContext context){
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,//初始化日期默认位置
      firstDate: date,//起始日期
      lastDate: date.add(Duration(days: 30))//结束日期（未来30天内）
    );
  }

  //ios风格日历选择器
  Future<DateTime> _showDatePickerIOS(BuildContext context){
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              choosedTime = value;
              print(value);
            },
          ),
        );
      },
    );
  }
}