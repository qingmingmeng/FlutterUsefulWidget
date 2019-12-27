import 'package:flutter/material.dart';

const searchList = [
  'qingmingmeng-xuexi',
  'qingmingmeng-gongzuo',
  'qingmingmeng-chifan',
  'qingmingmeng-xiuxi',
];

const recentSuggest = [
  '推荐-1',
  '推荐-2',
];

class SeachBarDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {//右侧部分
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {//左侧部分
    return IconButton(
      icon: AnimatedIcon(//带动画的按钮
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context,null),//关闭
    );
  }

  @override
  Widget buildResults(BuildContext context) {//搜索结果展示
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {//提示建议
    final suggestionList = query.isEmpty ? recentSuggest : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index) => ListTile(
        title: RichText(//富文本
          text: TextSpan(
            text: suggestionList[index].substring(0,query.length),//截取到输入框的文字
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),//截取未输入的文字
                style: TextStyle(
                  color: Colors.grey,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}