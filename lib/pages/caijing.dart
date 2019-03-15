import 'package:flutter/material.dart';
import 'package:zw_news/util.dart';
import 'commonListView.dart';

class CaiJing extends StatefulWidget {
  final type;

  CaiJing(this.type);

  @override
  _CaiJingState createState() => _CaiJingState(type);
}

class _CaiJingState extends State<CaiJing> with AutomaticKeepAliveClientMixin {
  final type;

  _CaiJingState(this.type);

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
