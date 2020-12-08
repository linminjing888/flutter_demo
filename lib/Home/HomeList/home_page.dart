/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 09:49:15
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 16:31:33
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Home/HomeList/home_content.dart';
import 'package:flutter_demo/Home/SearchList/app_search_page.dart';
import 'package:flutter_demo/generated/l10n.dart';

class MJHomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home),
        automaticallyImplyLeading: false, // 隐藏返回按钮
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed(MJSearchPage.routeName);
            },
          )
        ],
      ),
      body: HomeContent(),
    );
  }
}
