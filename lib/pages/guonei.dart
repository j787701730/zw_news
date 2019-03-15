import 'package:flutter/material.dart';
import 'package:zw_news/util.dart';
import 'commonListView.dart';

class GuoNei extends StatefulWidget {
  final type;

  GuoNei(this.type);

  @override
  _GuoNeiState createState() => _GuoNeiState(type);
}

class _GuoNeiState extends State<GuoNei> with AutomaticKeepAliveClientMixin {
  final type;

  _GuoNeiState(this.type);

  List newsData = [];

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
          newsData = data['result']['data'];
        });
      }
    }, (data) {}, context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CommonListView(newsData),
    );
  }
}
