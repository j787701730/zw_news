import 'package:flutter/material.dart';
import 'package:zw_news/util.dart';
import 'commonListView.dart';

class TiYu extends StatefulWidget {
  final type;

  TiYu(this.type);

  @override
  _TiYuState createState() => _TiYuState(type);
}

class _TiYuState extends State<TiYu> with AutomaticKeepAliveClientMixin {
  final type;

  _TiYuState(this.type);

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
