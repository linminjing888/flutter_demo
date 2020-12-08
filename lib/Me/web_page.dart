/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-08 17:07:43
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 17:44:09
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MJWebPage extends StatefulWidget {
  static const String routeName = "/web";

  final String url;
  final String title;
  MJWebPage({@required this.url, this.title});

  @override
  _MJWebPageState createState() => _MJWebPageState();
}

class _MJWebPageState extends State<MJWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.widget.title == null ? "" : this.widget.title),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: WebView(
          initialUrl: this.widget.url,
        ));
  }
}
