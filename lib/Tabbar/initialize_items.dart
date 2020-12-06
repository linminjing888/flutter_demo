import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/group_page.dart';
import 'package:flutter_demo/Tabbar/bottom_bar_item.dart';
import 'package:flutter_demo/Home/home_page.dart';

List<MJBottomBarItem> items = [
  MJBottomBarItem("首页", "home"),
  MJBottomBarItem("小组", "group"),
  MJBottomBarItem("市集", "mall"),
  MJBottomBarItem("我的", "profile"),
];

List<Widget> pages = [
  MJHomePage(),
  MJGroupPage(),
  MJGroupPage(),
  MJGroupPage(),
];
