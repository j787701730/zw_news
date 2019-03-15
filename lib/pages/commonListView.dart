import 'package:flutter/material.dart';
import 'package:zw_news/pageLoading.dart';
import 'package:zw_news/newsContent.dart';

class CommonListView extends StatelessWidget {
  final data;

  CommonListView(this.data);

  int padding = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: data.isEmpty
          ? PageLoading()
          : ListView(
              children: data.map<Widget>((item) {
                return ListTile(
                  contentPadding: EdgeInsets.only(left: 10, right: 10,bottom: 6),
                  title: Text(item['title']),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - padding) / 3,
                        height: (MediaQuery.of(context).size.width - padding) / 3,
                        child: item['thumbnail_pic_s'] != null
                            ? Image.network(
                                item['thumbnail_pic_s'],
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - padding) / 3,
                        height: (MediaQuery.of(context).size.width - padding) / 3,
                        child: item['thumbnail_pic_s02'] != null
                            ? Image.network(
                                item['thumbnail_pic_s02'],
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - padding) / 3,
                        height: (MediaQuery.of(context).size.width - padding) / 3,
                        child: item['thumbnail_pic_s03'] != null
                            ? Image.network(
                                item['thumbnail_pic_s03'],
                                fit: BoxFit.cover,
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
