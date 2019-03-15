import 'package:flutter/material.dart';
import 'package:zw_news/util.dart';
import 'commonListView.dart';

class ShiShang extends StatefulWidget {
  final type;

  ShiShang(this.type);

  @override
  _ShiShangState createState() => _ShiShangState(type);
}

class _ShiShangState extends State<ShiShang> with AutomaticKeepAliveClientMixin {
  final type;

  _ShiShangState(this.type);

  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNews();
  }

  List newsData = [];

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
