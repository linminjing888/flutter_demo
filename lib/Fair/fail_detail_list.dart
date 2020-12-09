/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 14:14:50
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 14:14:51
 * @Descripttion: 
 */
// 动态创建
import 'package:flutter/material.dart';

class HomeListView2 extends StatelessWidget {
  final String title;
  HomeListView2({this.title});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
          itemExtent: 60, // 每一个item的高度
          itemCount: 15,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$title ${index + 1}"),
              subtitle: Text("this is a description"),
              leading: Icon(Icons.account_box),
            );
          }),
    );
  }
}
