/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 09:49:15
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-22 15:48:09
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/group_%20recommend_page.dart';
import 'package:flutter_demo/Group/group_activity_page.dart';
import 'package:flutter_demo/Group/group_slidable_page.dart';
import 'package:flutter_demo/Group/group_subject_page.dart';
import 'package:flutter_demo/generated/l10n.dart';

class MJGroupPage extends StatelessWidget {
  final List<String> _tabTitles = ["活动", "推荐", "专题", "连载"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).group),
            automaticallyImplyLeading: false,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TabBar(
                  labelColor: Colors.white,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.fromLTRB(2, 0, 2, 5),
                  tabs: _tabTitles.map((e) {
                    return Tab(text: e);
                  }).toList(),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              MJActivityPage(),
              MJRecommendPage(),
              MJGroupFailPage(),
              MJGroupSlidablePage(),
            ],
          )),
    );
  }
}
