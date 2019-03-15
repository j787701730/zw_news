import 'package:flutter/material.dart';
import 'package:zw_news/util.dart';
import 'commonListView.dart';

class YuLe extends StatefulWidget {
  final type;

  YuLe(this.type);

  @override
  _YuLeState createState() => _YuLeState(type);
}

class _YuLeState extends State<YuLe> with AutomaticKeepAliveClientMixin {
  final type;

  _YuLeState(this.type);

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
