import 'package:flutter/material.dart';
import 'package:zw_news/util.dart';
import 'commonListView.dart';

class SheHui extends StatefulWidget {
  final type;

  SheHui(this.type);

  @override
  _SheHuiState createState() => _SheHuiState(type);
}

class _SheHuiState extends State<SheHui> with AutomaticKeepAliveClientMixin {
  final type;

  _SheHuiState(this.type);

  List NewsData = [];

  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNews();
  }

  _getNews() {
    ajax('http://v.juhe.cn/toutiao/index?type=$type&', '', false, (data) {
      if (data['result'] != null && data['result']['data'] != null) {
        setState(() {
          NewsData = data['result']['data'];
        });
      }
    }, (data) {}, context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CommonListView(NewsData),
    );
  }
}
