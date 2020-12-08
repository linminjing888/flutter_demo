/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 15:49:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 16:37:02
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/l10n.dart';
import 'me_content.list.dart';

class MJMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).My),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            "assets/images/me_refresh.png",
          ),
          padding: EdgeInsets.all(15.0),
          onPressed: () {
            print("刷新");
          },
        ),
        actions: <Widget>[
          IconButton(
              icon: Image.asset("assets/images/me_message.png"),
              padding: EdgeInsets.all(15.0),
              onPressed: () {
                print("消息");
              }),
        ],
      ),
      body: MJContentList(),
    );
  }
}
