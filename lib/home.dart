import 'package:flutter/material.dart';
import 'pages/top.dart';
import 'pages/shehui.dart';
import 'pages/guonei.dart';
import 'pages/guoji.dart';
import 'pages/yule.dart';
import 'pages/tiyu.dart';
import 'pages/junshi.dart';
import 'pages/keji.dart';
import 'pages/caijing.dart';
import 'pages/shishang.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  List newsType = [
    {'label': '头条', 'value': 'top'},
    {'label': '社会', 'value': 'shehui'},
    {'label': '国内', 'value': 'guonei'},
    {'label': '国际', 'value': 'guoji'},
    {'label': '娱乐', 'value': 'yule'},
    {'label': '体育', 'value': 'tiyu'},
    {'label': '军事', 'value': 'junshi'},
    {'label': '科技', 'value': 'keji'},
    {'label': '财经', 'value': 'caijing'},
    {'label': '时尚', 'value': 'shishang'},
  ];

  String type = 'top';

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: newsType.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('NEWS'),
        centerTitle: true,
        bottom: new TabBar(
          isScrollable: true,
          tabs: newsType.map<Widget>((item) {
            return (Tab(child: Text(item['label'])));
          }).toList(),
          controller: _tabController,
        ),
      ),
      body: new TabBarView(controller: _tabController, children: <Widget>[
        Top('top'),
        SheHui('shehui'),
        GuoNei('guonei'),
        GuoJi('guoji'),
        YuLe('yule'),
        TiYu('tiyu'),
        JunShi('junshi'),
        KeJi('keji'),
        CaiJing('caijing'),
        ShiShang('shishang')
      ]),
    );
  }
}
