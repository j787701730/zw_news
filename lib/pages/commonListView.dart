import 'package:flutter/material.dart';
import 'package:zw_news/pageLoading.dart';
import 'package:zw_news/newsContent.dart';

class CommonListView extends StatelessWidget {
  final data;

  CommonListView(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: data.isEmpty
          ? PageLoading()
          : ListView(
              children: data.map<Widget>((item) {
                return ListTile(
                  title: Text(item['title']),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 60) / 3,
                        height: (MediaQuery.of(context).size.width - 60) / 3,
                        child: item['thumbnail_pic_s'] != null
                            ? Image.network(
                                item['thumbnail_pic_s'],
                                fit: BoxFit.contain,
                              )
                            : null,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 60) / 3,
                        height: (MediaQuery.of(context).size.width - 60) / 3,
                        child: item['thumbnail_pic_s02'] != null
                            ? Image.network(
                                item['thumbnail_pic_s02'],
                                fit: BoxFit.contain,
                              )
                            : null,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 60) / 3,
                        height: (MediaQuery.of(context).size.width - 60) / 3,
                        child: item['thumbnail_pic_s03'] != null
                            ? Image.network(
                                item['thumbnail_pic_s03'],
                                fit: BoxFit.contain,
                              )
                            : null,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                      return new NewsContent(item['url'], item['title']);
                    }));
                  },
                );
              }).toList(),
            ),
    );
  }
}
